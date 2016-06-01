require 'test_helper'

class PeopleControllerTest < ActionController::TestCase

  setup do
    @person = people(:first)
  end

  test "should get show" do
    get :show, id: @person.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person.id
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { first_name: Faker::Name.first_name,
                              last_name: Faker::Name.last_name,
                              email: Faker::Internet.email,
                              job: Faker::Company.name,
                              bio: Faker::Lorem.paragraph,
                              gender: "male",
                              birthdate: Faker::Date.backward(10000),
                              picture: Faker::Avatar.image }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should update person" do
    patch :update, id: @person.id, person: { first_name: Faker::Name.first_name,
                                              last_name: Faker::Name.last_name,
                                              email: Faker::Internet.email,
                                              job: Faker::Company.name,
                                              bio: Faker::Lorem.paragraph,
                                              gender: "male",
                                              birthdate: Faker::Date.backward(10000),
                                              picture: Faker::Avatar.image }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person.id
    end

    assert_redirected_to people_path
  end

end
