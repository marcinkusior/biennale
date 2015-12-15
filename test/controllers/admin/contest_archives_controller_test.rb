require 'test_helper'

class Admin::ContestArchivesControllerTest < ActionController::TestCase
  setup do
    @contest_archive = contest_archives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contest_archives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contest_archive" do
    assert_difference('ContestArchive.count') do
      post :create, contest_archive: { title: @contest_archive.title, titlePL: @contest_archive.titlePL }
    end

    assert_redirected_to admin_contest_archive_path(assigns(:contest_archive))
  end

  test "should show contest_archive" do
    get :show, id: @contest_archive
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contest_archive
    assert_response :success
  end

  test "should update contest_archive" do
    patch :update, id: @contest_archive, contest_archive: { title: @contest_archive.title, titlePL: @contest_archive.titlePL }
    assert_redirected_to admin_contest_archive_path(assigns(:contest_archive))
  end

  test "should destroy contest_archive" do
    assert_difference('ContestArchive.count', -1) do
      delete :destroy, id: @contest_archive
    end

    assert_redirected_to admin_contest_archives_path
  end
end
