require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get Welcome" do
    get :Welcome
    assert_response :success
  end

end
