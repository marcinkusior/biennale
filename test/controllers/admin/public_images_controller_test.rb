require 'test_helper'

class Admin::PublicImagesControllerTest < ActionController::TestCase
  setup do
    @public_image = public_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:public_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create public_image" do
    assert_difference('PublicImage.count') do
      post :create, public_image: { contest_record_id: @public_image.contest_record_id, src: @public_image.src }
    end

    assert_redirected_to admin_public_image_path(assigns(:public_image))
  end

  test "should show public_image" do
    get :show, id: @public_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @public_image
    assert_response :success
  end

  test "should update public_image" do
    patch :update, id: @public_image, public_image: { contest_record_id: @public_image.contest_record_id, src: @public_image.src }
    assert_redirected_to admin_public_image_path(assigns(:public_image))
  end

  test "should destroy public_image" do
    assert_difference('PublicImage.count', -1) do
      delete :destroy, id: @public_image
    end

    assert_redirected_to admin_public_images_path
  end
end
