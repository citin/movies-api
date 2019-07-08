FactoryBot.define do
  factory :purchase_option do
    factory :purchase_option_movie_hd do
      price { 2.99 }
      video_quality { "HD" }
      association :content, factory: :movie
    end

    factory :purchase_option_season_hd do
      price { 2.00 }
      video_quality { "HD" }
      association :content, factory: :season
    end
  end
end
