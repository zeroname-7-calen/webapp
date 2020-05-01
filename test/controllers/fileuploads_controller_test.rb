require 'test_helper'

class FileuploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fileuploads_create_url
    assert_response :success
  end

  test "should get new" do
    get fileuploads_new_url
    assert_response :success
  end

end
