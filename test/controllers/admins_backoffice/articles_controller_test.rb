require "test_helper"

class AdminsBackoffice::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_articles_index_url
    assert_response :success
  end
end
