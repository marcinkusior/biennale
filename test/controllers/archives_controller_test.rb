require 'test_helper'

class ArchivesControllerTest < ActionController::TestCase
  test "should get fetch_records" do
    get :fetch_records
    assert_response :success
  end

end
