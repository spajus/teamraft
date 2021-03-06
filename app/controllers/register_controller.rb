class RegisterController < ApplicationController

  before_filter :authenticate_person!, only: :person

  def company
    @company = Company.new
    @person = Person.new

    return unless request.post?

    @company = Company.new(params.require(:company).permit(:name))
    @company.registration_code = rand(36 ** 16).to_s(36)
    @person =  Person.new(params.require(:person).permit(:name, :email, :password))

    return unless @company.valid?

    @person.company = @company
    @person.admin = true
    @person.approve_by(@person)

    return unless @person.valid?

    @company.save
    @person.save

    sign_in(:person, @person)

    return redirect_to company_path
  end

  def himself
    return render 'himself_instructions' if person_signed_in?

    @person = Person.new
    @company = Company.where(registration_code: params[:reg_code]).first

    not_found unless @company

    return unless request.post?

    @person = Person.new(params.require(:person).permit(:name, :email, :password))
    @person.company = @company
    if @company.auto_approve?
      @person.joined_at = DateTime.now
    end
    @person.update_person_attributes(params[:person_attributes])
    if @person.valid?
      @person.save
      sign_in(:person, @person)
      PersonMailer.you_added_yourself(@person, @company).deliver
      return redirect_to company_path
    end
  end

  def person
    @person = Person.new
    @company = current_person.company

    return unless request.post?

    @person = Person.new(params.require(:person).permit(:name, :email, :tag_list))
    @person.company = @company
    @person.approve_by(current_person)

    generated_password = Devise.friendly_token.first(8)
    @person.password = generated_password
    @person.update_person_attributes(params[:person_attributes])
    if @person.valid?
      @person.save
      PersonMailer.you_were_added(@person, @company, current_person, generated_password).deliver
      return redirect_to company_path
    end
  end
end
