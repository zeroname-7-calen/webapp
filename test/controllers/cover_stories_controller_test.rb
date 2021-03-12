require 'test_helper'

class CoverStoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cover_stories_index_url
    assert_response :success
  end

  test "should get show" do
    get cover_stories_show_url
    assert_response :success
  end

  test "should get new" do
    get cover_stories_new_url
    assert_response :success
  end

  test "should get edit" do
    get cover_stories_edit_url
    assert_response :success
  end

end
