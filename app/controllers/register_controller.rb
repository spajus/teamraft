class RegisterController < ApplicationController
  def company
    if request.post?
      @company = Company.new(params.require(:company).permit(:name))
      @person =  Person.new(params.require(:person).permit(:name, :email, :password))
      if @company.valid?
        @person.company = @company
        @person.admin = true
        @person.approve_by(@person)
        if @person.valid?
          @company.save
          @person.save
          sign_in(:person, @person)
          return redirect_to company_path
        end
      end
    else
      @company = Company.new
      @person = Person.new
    end
  end

  def person
  end
end
