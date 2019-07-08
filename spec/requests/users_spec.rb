require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  # Test suit for GET /api/v1/users/:id/purchases
  describe 'GET /api/v1/users/:id/purchases' do
    let(:user) { create(:user_with_purchases) }

    before { get "/api/v1/users/#{user.id}/purchases" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it "returns user library" do
      expect(json).not_to be_empty
      expect(json["data"].size).to eq(user.library.count)
    end
  end
end

# Test suit for POST /api/v1/users/:id/purchase
describe 'POST /api/v1/users/:id/purchase' do
end
