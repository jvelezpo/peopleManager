require 'test_helper'

class PeopleMailerTest < ActionMailer::TestCase

  setup do
    @from = people(:first)
    @to = people(:second)
  end

  test "created_person" do
    mail = PeopleMailer.created_person(@to.id, @from.full_name)
    assert_equal "People App - New person added", mail.subject
    assert_equal [@to.email], mail.to
    assert_equal ["from@example.com"], mail.from
  end

  test "deleted_person" do
    mail = PeopleMailer.deleted_person(@to.id, @from.full_name)
    assert_equal "People App - New person deleted", mail.subject
    assert_equal [@to.email], mail.to
    assert_equal ["from@example.com"], mail.from
  end

end
