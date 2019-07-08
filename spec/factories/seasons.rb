FactoryBot.define do
  factory :season do
    sequence(:title) { |n| "Breaking Bad: Season #{n}" }
    plot { "Lorem ipsum dolor sit amet." }
    after :create do |season|
      create_list :episode, 10, season: season
    end
  end
end
