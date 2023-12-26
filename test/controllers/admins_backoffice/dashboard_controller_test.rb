require "test_helper"

class AdminsBackoffice::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_dashboard_index_url
    assert_response :success
  end
end
