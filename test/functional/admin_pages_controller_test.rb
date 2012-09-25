require 'test_helper'

class AdminPagesControllerTest < ActionController::TestCase
  test "should get dataentry" do
    get :dataentry
    assert_response :success
  end

end
