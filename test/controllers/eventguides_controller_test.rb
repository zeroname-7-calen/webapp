require 'test_helper'

class EventguidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eventguides_index_url
    assert_response :success
  end

  test "should get show" do
    get eventguides_show_url
    assert_response :success
  end

  test "should get new" do
    get eventguides_new_url
    assert_response :success
  end

  test "should get edit" do
    get eventguides_edit_url
    assert_response :success
  end

end
