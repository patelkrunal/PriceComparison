require 'test_helper'

class ClientPagesControllerTest < ActionController::TestCase
  test "should get result" do
    get :result
    assert_response :success
  end

end
