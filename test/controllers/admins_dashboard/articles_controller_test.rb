require "test_helper"

class AdminsDashboard::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_dashboard_articles_index_url
    assert_response :success
  end
end
