class User < ApplicationRecord

  class AlreadyPurchasedError < StandardError; end

  has_many :purchases

  def library
    self.purchases.select {|p| p.alive? }
  end

  def purchase(purchase_option)
    # todo: remove content assoc from Purchase
    #       check if content is already purchased
    if is_in_library?(purchase_option.content)
      raise AlreadyPurchasedError
    else
      self.purchases << Purchase.create(purchase_option: purchase_option)
    end
  end

  private

  def is_in_library?(content)
    library.any? {|purchase| purchase.content.title == content.title }
  end
end
