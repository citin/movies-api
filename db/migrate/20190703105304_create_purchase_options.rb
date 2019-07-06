class CreatePurchaseOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_options do |t|
      t.float :price
      t.string :video_quality
      t.references :content, polymorphic: true

      t.timestamps
    end
  end
end
