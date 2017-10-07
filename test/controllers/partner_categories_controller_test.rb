require 'test_helper'

class PartnerCategoriesControllerTest < ActionController::TestCase
  setup do
    @partner_category = partner_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partner_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partner_category" do
    assert_difference('PartnerCategory.count') do
      post :create, partner_category: { name: @partner_category.name }
    end

    assert_redirected_to partner_category_path(assigns(:partner_category))
  end

  test "should show partner_category" do
    get :show, id: @partner_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partner_category
    assert_response :success
  end

  test "should update partner_category" do
    patch :update, id: @partner_category, partner_category: { name: @partner_category.name }
    assert_redirected_to partner_category_path(assigns(:partner_category))
  end

  test "should destroy partner_category" do
    assert_difference('PartnerCategory.count', -1) do
      delete :destroy, id: @partner_category
    end

    assert_redirected_to partner_categories_path
  end
end
