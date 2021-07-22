class CreateVariantAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :variant_attributes do |t|
      t.string :name
      t.references :variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
