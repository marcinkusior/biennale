require 'test_helper'

class Admin::GeneralsControllerTest < ActionController::TestCase
  setup do
    @general = generals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create general" do
    assert_difference('General.count') do
      post :create, general: { registration: @general.registration, registration_conference: @general.registration_conference, voting: @general.voting }
    end

    assert_redirected_to admin_general_path(assigns(:general))
  end

  test "should show general" do
    get :show, id: @general
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @general
    assert_response :success
  end

  test "should update general" do
    patch :update, id: @general, general: { registration: @general.registration, registration_conference: @general.registration_conference, voting: @general.voting }
    assert_redirected_to admin_general_path(assigns(:general))
  end

  test "should destroy general" do
    assert_difference('General.count', -1) do
      delete :destroy, id: @general
    end

    assert_redirected_to admin_generals_path
  end
end
