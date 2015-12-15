require 'test_helper'

class Admin::ContestRecordsControllerTest < ActionController::TestCase
  setup do
    @contest_record = contest_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contest_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contest_record" do
    assert_difference('ContestRecord.count') do
      post :create, contest_record: { body: @contest_record.body, bodyPL: @contest_record.bodyPL, title: @contest_record.title, titlePL: @contest_record.titlePL }
    end

    assert_redirected_to admin_contest_record_path(assigns(:contest_record))
  end

  test "should show contest_record" do
    get :show, id: @contest_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contest_record
    assert_response :success
  end

  test "should update contest_record" do
    patch :update, id: @contest_record, contest_record: { body: @contest_record.body, bodyPL: @contest_record.bodyPL, title: @contest_record.title, titlePL: @contest_record.titlePL }
    assert_redirected_to admin_contest_record_path(assigns(:contest_record))
  end

  test "should destroy contest_record" do
    assert_difference('ContestRecord.count', -1) do
      delete :destroy, id: @contest_record
    end

    assert_redirected_to admin_contest_records_path
  end
end
