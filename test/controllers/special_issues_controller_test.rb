require 'test_helper'

class SpecialIssuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get special_issues_index_url
    assert_response :success
  end

  test "should get show" do
    get special_issues_show_url
    assert_response :success
  end

  test "should get new" do
    get special_issues_new_url
    assert_response :success
  end

  test "should get edit" do
    get special_issues_edit_url
    assert_response :success
  end

end
