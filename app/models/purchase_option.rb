class PurchaseOption < ApplicationRecord
  has_many :purchases
  belongs_to :content, polymorphic: true
end
