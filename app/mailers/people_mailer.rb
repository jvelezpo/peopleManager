class PeopleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.people_mailer.created_person.subject
  #
  def created_person(person, full_name)
    @person = person
    @created = full_name

    mail to: person.email, subject: "People App - New person added"
  end

  def deleted_person(person, full_name)
    @person = person
    @deleted = full_name

    mail to: person.email, subject: "People App - New person deleted"
  end
end
