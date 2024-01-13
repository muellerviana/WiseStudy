require 'rails_helper'

RSpec.describe "Site::Articles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/site/articles/index"
      expect(response).to have_http_status(:success)
    end
  end

end
