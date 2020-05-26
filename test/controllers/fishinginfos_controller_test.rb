require 'test_helper'

class FishinginfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fishinginfos_index_url
    assert_response :success
  end

  test "should get show" do
    get fishinginfos_show_url
    assert_response :success
  end

  test "should get new" do
    get fishinginfos_new_url
    assert_response :success
  end

  test "should get edit" do
    get fishinginfos_edit_url
    assert_response :success
  end

end
