require 'test_helper'

class IncomingControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get incoming_create_url
    assert_response :success
  end

end
