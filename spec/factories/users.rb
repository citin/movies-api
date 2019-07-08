FactoryBot.define do
  factory :user do
    email { "test@user.com"}
    factory :user_with_purchases do
      after :create do |user|
        create_list :purchase_movie, 2, user: user
        create_list :purchase_season, 2, user: user
      end
    end
  end
end
