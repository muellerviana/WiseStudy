require "test_helper"

class AdminsDashboard::AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_dashboard_authors_index_url
    assert_response :success
  end
end
