require 'test_helper'

class Admin::RegistrationsControllerTest < ActionController::TestCase
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, registration: { University: @registration.University, city: @registration.city, country: @registration.country, email: @registration.email, first_Name: @registration.first_Name, last_Name: @registration.last_Name, street: @registration.street, supervisor_proffesor: @registration.supervisor_proffesor, telephone: @registration.telephone, terms_of_servie: @registration.terms_of_servie, zip_code: @registration.zip_code }
    end

    assert_redirected_to admin_registration_path(assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration
    assert_response :success
  end

  test "should update registration" do
    patch :update, id: @registration, registration: { University: @registration.University, city: @registration.city, country: @registration.country, email: @registration.email, first_Name: @registration.first_Name, last_Name: @registration.last_Name, street: @registration.street, supervisor_proffesor: @registration.supervisor_proffesor, telephone: @registration.telephone, terms_of_servie: @registration.terms_of_servie, zip_code: @registration.zip_code }
    assert_redirected_to admin_registration_path(assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration
    end

    assert_redirected_to admin_registrations_path
  end
end
