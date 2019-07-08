class PurchaseSerializer < ActiveModel::Serializer 
# content {title, remaining_time, price, quality}
  attributes :title, :remaining_time, :price, :video_quality

  def title 
    object.content.title
  end 

  def price 
    object.purchase_option.price
  end 

  def video_quality 
    object.purchase_option.video_quality
  end 
end
