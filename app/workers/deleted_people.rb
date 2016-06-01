class DeletedPeople
  @queue = :delete_people_email

  def self.perform(person_id, full_name)
    person = Person.find(person_id)
    PeopleMailer.deleted_person(person, full_name).deliver_later
  end
end