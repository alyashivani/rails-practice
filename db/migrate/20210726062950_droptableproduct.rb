class Droptableproduct < ActiveRecord::Migration[6.1]
  def change
    drop_table :product_variants
  end
end
