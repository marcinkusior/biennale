require 'test_helper'

class Admin::AdministratorsControllerTest < ActionController::TestCase
  setup do
    @administrator = administrators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administrators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administrator" do
    assert_difference('Administrator.count') do
      post :create, administrator: { email: @administrator.email, password_digest: @administrator.password_digest }
    end

    assert_redirected_to admin_administrator_path(assigns(:administrator))
  end

  test "should show administrator" do
    get :show, id: @administrator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administrator
    assert_response :success
  end

  test "should update administrator" do
    patch :update, id: @administrator, administrator: { email: @administrator.email, password_digest: @administrator.password_digest }
    assert_redirected_to admin_administrator_path(assigns(:administrator))
  end

  test "should destroy administrator" do
    assert_difference('Administrator.count', -1) do
      delete :destroy, id: @administrator
    end

    assert_redirected_to admin_administrators_path
  end
end
