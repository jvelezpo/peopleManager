class CreatedPerson
  @queue = :created_person_email

  def self.perform(person_id, full_name)
    person = Person.find(person_id)
    PeopleMailer.created_person(person, full_name).deliver_later
  end
end