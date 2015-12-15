require 'test_helper'

class Admin::NewsaddressesControllerTest < ActionController::TestCase
  setup do
    @newsaddress = newsaddresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newsaddresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newsaddress" do
    assert_difference('Newsaddresse.count') do
      post :create, newsaddress: { email: @newsaddress.email }
    end

    assert_redirected_to admin_newsaddress_path(assigns(:newsaddress))
  end

  test "should show newsaddress" do
    get :show, id: @newsaddress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newsaddress
    assert_response :success
  end

  test "should update newsaddress" do
    patch :update, id: @newsaddress, newsaddress: { email: @newsaddress.email }
    assert_redirected_to admin_newsaddress_path(assigns(:newsaddress))
  end

  test "should destroy newsaddress" do
    assert_difference('Newsaddresse.count', -1) do
      delete :destroy, id: @newsaddress
    end

    assert_redirected_to admin_newsaddresses_path
  end
end
