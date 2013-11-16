class PersonMailer < ActionMailer::Base
  default from: "from@example.com"

  def you_were_added(person, company, added_by, password)
    @person = person
    @company = company
    @added_by = added_by
    @password = password
    mail(to: @person.email, subject: "You were added to #{@company.name}")
  end
end
