require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.create(email: "user_test@testing.com") }
  let(:movie_content) do 
    Movie.create(
      title: "Perdido en ti", 
      plot: "Lorem ipsum dolor sit amet.")
  end
  let(:purchase_option_hd) { PurchaseOption.create(price: 2.99, video_quality: "HD", content: movie_content) }

  context "associations" do
    it { should have_many(:purchases) } 
  end

  it "can purchase a content" do
    user.purchase(purchase_option_hd)

    expect(user.library.size).to eql(1)
  end

  it "exclude expired purchase from libray" do
    user.purchase(purchase_option_hd)

    user.purchases.first.update(created_at: 3.days.ago)

    expect(user.library.size).to eql(0)
  end

  it "can't purchase a content that is in the library" do
    user.purchase(purchase_option_hd)

    expect{ user.purchase(purchase_option_hd) }.to raise_error(User::AlreadyPurchasedError)
  end
end
