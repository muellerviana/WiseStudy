require "test_helper"

class Site::AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_authors_index_url
    assert_response :success
  end
end
