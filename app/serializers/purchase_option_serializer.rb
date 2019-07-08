class PurchaseOptionSerializer < ActiveModel::Serializer 
  attributes :id, :created_at

  has_one :content
end
