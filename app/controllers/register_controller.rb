class RegisterController < ApplicationController
  def company
    @company = Company.new
    @person = Person.new

    return unless request.post?

    @company = Company.new(params.require(:company).permit(:name))
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

  def person
    @person = Person.new

    if person_signed_in?
      @company = current_person.company
      template = 'another_person'
    else
      template = 'person'
    end

    return unless request.post?

    @person = Person.new(params.require(:person).permit(:name, :email, :password))
    @person.company = @company
    @person.approve_by(current_person)

    generated_password = Devise.friendly_token.first(8)
    @person.password = generated_password

    if @person.valid?
      # TODO send email
      @person.save
      PersonMailer.you_were_added(@person, @company, current_person, generated_password).deliver
      return redirect_to company_path
    end

    render template
  end
end
