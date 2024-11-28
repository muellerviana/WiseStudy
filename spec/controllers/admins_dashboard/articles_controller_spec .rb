require 'rails_helper'

RSpec.describe AdminsDashboard::ArticlesController, type: :controller do
  it 'redirects when not authenticated' do
    get :index
    expect(response).to have_http_status(:found)
  end

  it 'responds successfully when authenticated' do
    admin = create(:admin)
    sign_in admin
    get :index, params: {id: admin.id}
    expect(response).to have_http_status(:success)
  end
end