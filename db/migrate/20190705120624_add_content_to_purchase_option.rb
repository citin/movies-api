class AddContentToPurchaseOption < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchase_options, :content, polymorphic: true
  end
end
