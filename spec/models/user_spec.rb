require 'rails_helper'

RSpec.describe User, type: :model do

  # SETUP
  let(:user) { create(:user_with_purchases) }

  # TEST SUITE
  context "associations" do
    it { should have_many(:purchases) } 
  end

  it "can purchase a content" do
    expect(user.library.size).to eql(4)
  end

  it "exclude expired purchase from libray" do
    user.purchases.first.update(created_at: 3.days.ago)

    expect(user.library.size).to eql(3)
  end

  it "library is ordered by purchase's remaining time" do
    user.purchases.last.update(created_at: 1.day.ago)

    expect(user.library.sorted_by?(&:remaining_time_in_minutes)).to eq(true)
  end
end
