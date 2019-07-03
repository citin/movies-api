class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
end
