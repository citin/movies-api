FactoryBot.define do
  factory :episode do
    sequence(:title) { |n| "Episode: #{n}" }
    plot { "Lorem ipsum dolor sit amet." }
  end
end
