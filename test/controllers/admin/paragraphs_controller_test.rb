require 'test_helper'

class Admin::ParagraphsControllerTest < ActionController::TestCase
  setup do
    @paragraph = paragraphs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paragraphs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paragraph" do
    assert_difference('Paragraph.count') do
      post :create, paragraph: { body: @paragraph.body, page_id: @paragraph.page_id }
    end

    assert_redirected_to admin_paragraph_path(assigns(:paragraph))
  end

  test "should show paragraph" do
    get :show, id: @paragraph
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paragraph
    assert_response :success
  end

  test "should update paragraph" do
    patch :update, id: @paragraph, paragraph: { body: @paragraph.body, page_id: @paragraph.page_id }
    assert_redirected_to admin_paragraph_path(assigns(:paragraph))
  end

  test "should destroy paragraph" do
    assert_difference('Paragraph.count', -1) do
      delete :destroy, id: @paragraph
    end

    assert_redirected_to admin_paragraphs_path
  end
end
