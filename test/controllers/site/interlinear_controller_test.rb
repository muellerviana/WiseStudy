require "test_helper"

class Site::InterlinearControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_interlinear_index_url
    assert_response :success
  end
end
