require 'test_helper'

class TopContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get top_contents_new_url
    assert_response :success
  end

  test "should get edit" do
    get top_contents_edit_url
    assert_response :success
  end

end
