require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get create" do
    get users_create_url
=======
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
>>>>>>> receive-incoming-emails
    assert_response :success
  end

end
