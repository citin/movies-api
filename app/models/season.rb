class Season < ApplicationRecord
  has_many :users, through: :purchases
  has_many :purchases, as: :content
  has_many :purchase_options, as: :content

  has_many :episodes
end
