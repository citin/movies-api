FactoryBot.define do
  factory :purchase do
    factory :purchase_movie do
      user
      association :purchase_option, factory: :purchase_option_movie_hd
    end

    factory :purchase_season do
      user
      association :purchase_option, factory: :purchase_option_season_hd
    end
  end
end
