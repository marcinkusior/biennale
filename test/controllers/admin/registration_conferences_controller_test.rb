require 'test_helper'

class Admin::RegistrationConferencesControllerTest < ActionController::TestCase
  setup do
    @registration_conference = registration_conferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_conferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_conference" do
    assert_difference('RegistrationConference.count') do
      post :create, registration_conference: { city: @registration_conference.city, country: @registration_conference.country, email: @registration_conference.email, first_name: @registration_conference.first_name, group_name: @registration_conference.group_name, last_name: @registration_conference.last_name, serial: @registration_conference.serial, street: @registration_conference.street, supervising_professor: @registration_conference.supervising_professor, telephone: @registration_conference.telephone, terms_of_service: @registration_conference.terms_of_service, university: @registration_conference.university, zip_code: @registration_conference.zip_code }
    end

    assert_redirected_to admin_registration_conference_path(assigns(:registration_conference))
  end

  test "should show registration_conference" do
    get :show, id: @registration_conference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration_conference
    assert_response :success
  end

  test "should update registration_conference" do
    patch :update, id: @registration_conference, registration_conference: { city: @registration_conference.city, country: @registration_conference.country, email: @registration_conference.email, first_name: @registration_conference.first_name, group_name: @registration_conference.group_name, last_name: @registration_conference.last_name, serial: @registration_conference.serial, street: @registration_conference.street, supervising_professor: @registration_conference.supervising_professor, telephone: @registration_conference.telephone, terms_of_service: @registration_conference.terms_of_service, university: @registration_conference.university, zip_code: @registration_conference.zip_code }
    assert_redirected_to admin_registration_conference_path(assigns(:registration_conference))
  end

  test "should destroy registration_conference" do
    assert_difference('RegistrationConference.count', -1) do
      delete :destroy, id: @registration_conference
    end

    assert_redirected_to admin_registration_conferences_path
  end
end
