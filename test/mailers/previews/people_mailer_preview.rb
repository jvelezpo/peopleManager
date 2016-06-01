# Preview all emails at http://localhost:3000/rails/mailers/people_mailer
class PeopleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/people_mailer/created_person
  def created_person
    PeopleMailer.created_person
  end

end
