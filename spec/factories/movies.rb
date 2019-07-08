FactoryBot.define do
  factory :movie do
    sequence :title do |n| 
      "Il Padrino #{n}"
    end
    plot { "Lorem ipsum dolor sit amet." }
  end
end
