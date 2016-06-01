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

require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "invalid without first name" do
    person = people(:noname)
    assert person.valid? == false
    assert_includes person.errors.messages.keys, :first_name
    assert_includes person.errors.messages.values.flatten, "can\'t be blank"
  end

  test "invalid without last name" do
    person = people(:nolast)
    assert person.valid? == false
    assert_includes person.errors.messages.keys, :last_name
    assert_includes person.errors.messages.values.flatten, "can\'t be blank"

  end

  test "invalid without email" do
    person = people(:noemail)
    assert person.valid? == false
    assert_includes person.errors.messages.keys, :email
    assert_includes person.errors.messages.values.flatten, "can\'t be blank"
  end

  test "invalid without gender" do
    person = people(:nogender)
    assert person.valid? == false
    assert_includes person.errors.messages.keys, :gender
    assert_includes person.errors.messages.values.flatten, "can\'t be blank"
  end

  test "invalid without birthdate" do
    person = people(:nobirthdate)
    assert person.valid? == false
    assert_includes person.errors.messages.keys, :birthdate
    assert_includes person.errors.messages.values.flatten, "can\'t be blank"
  end

  test "full name" do
    person = people(:first)
    assert person.full_name == "Sebastian Velez"
  end

  test "age" do
    person = people(:first)
    person.birthdate = Date.today - 37.years
    assert person.age == 37
  end

end
