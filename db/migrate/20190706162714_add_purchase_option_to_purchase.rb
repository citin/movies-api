class AddPurchaseOptionToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchases, :purchase_option, foreign_key: true
  end
end
