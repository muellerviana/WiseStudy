require "test_helper"

class AdminsDashboard::SermonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_dashboard_sermons_index_url
    assert_response :success
  end
end
