require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  let(:user) { create(:user_with_purchases) }

  # Test suit for GET /api/v1/users/:id/purchases
  describe 'GET /api/v1/users/:id/purchases' do

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

  let(:user) { create(:user) }
  let(:purchase_option) { create(:purchase_option_movie_hd) }

  before do 
    post "/api/v1/users/#{user.id}/purchase",
      params: { purchase_option_id: purchase_option.id }
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it "adds element in user's library" do
    expect(json["data"].count).to eq(1)
  end

  it "return error if is already purchased" do
    post "/api/v1/users/#{user.id}/purchase",
      params: { purchase_option_id: purchase_option.id }

      expect(response).to have_http_status(405)
      expect(json["error"]).to include("AlreadyPurchasedError")
  end
end
