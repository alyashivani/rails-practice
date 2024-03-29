class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :product_id
      t.float :unit_price
      t.integer :qty

      t.timestamps
    end
  end
end
