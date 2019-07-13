require 'rails_helper'

RSpec.describe Purchase, type: :model do

  # SETUP
  let(:purchase) { create(:purchase_movie) }
  let(:old_purchase) { create(:old_purchase) }

  # TEST SUITE
  it "is alive for 48hs" do
    expect(purchase.alive?).to eq(true)
  end

  it "is not alive after 48hs" do
    expect(old_purchase.alive?).to eq(false)
  end

  it "remaining time is approximately 2880 minutes (2 days)" do
    expect(purchase.remaining_time_in_minutes).to be_within(2878).of(2880)
  end

  it "remaining time is zero minutes after two days" do
    expect(old_purchase.remaining_time_in_minutes).to eq(0)
  end
end
