require 'rails_helper'

RSpec.describe Site::ArticlesController, type: :controller do
  it 'responds successfully' do
    get :index
    expect(response).to have_http_status(:success)
  end
end
