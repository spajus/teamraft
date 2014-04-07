class PersonMailer < ActionMailer::Base
  default from: "no-reply@teamraft.com"

  def you_were_added(person, company, added_by, password)
    @person = person
    @company = company
    @added_by = added_by
    @password = password
    mail(to: @person.email, subject: "You were added to #{@company.name}")
  end

  def you_added_yourself(person, company)
    @person = person
    @company = company
    mail(to: @person.email, subject: "You registered with #{@company.name}")
  end
end
