# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  job        :string
#  bio        :text
#  gender     :integer
#  birthdate  :date
#  picture    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ActiveRecord::Base

  enum gender: [:male, :female]

  validates :first_name, presence: true, length: 1..75
  validates :last_name, presence: true, length: 1..75
  validates :email, presence: true, length: 1..254, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :job, allow_blank: true, length: { maximum: 75 }
  validates :bio, allow_blank: true, length: { minimum: 5 }
  validates :gender, presence: true
  validates :birthdate, presence: true, date: { before: Proc.new { Time.now } }

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    # http://stackoverflow.com/questions/819263/get-persons-age-in-ruby
    age = Date.today.year - birthdate.year
    age -= 1 if Date.today < birthdate + age.years #for days before birthday
    age
  end

  def send_created_email_to_all
    Person.where.not(id: id).each do |person|
      Resque.enqueue(CreatedPerson, person.id, full_name)
    end
  end

  def send_deleted_email_to_all
    Person.where.not(id: id).each do |person|
      Resque.enqueue(DeletedPeople, person.id, full_name)
    end
  end
end
