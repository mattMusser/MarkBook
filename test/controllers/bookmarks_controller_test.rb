require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookmarks_index_url
    assert_response :success
  end

  test "should get show" do
    get bookmarks_show_url
    assert_response :success
  end

  test "should get new" do
    get bookmarks_new_url
    assert_response :success
  end

  test "should get edit" do
    get bookmarks_edit_url
    assert_response :success
  end

  test "should get update" do
    get bookmarks_update_url
    assert_response :success
  end

  test "should get destroyt" do
    get bookmarks_destroyt_url
    assert_response :success
  end

end
