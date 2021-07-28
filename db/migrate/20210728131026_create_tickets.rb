class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :category
      t.float :price
      t.date :booked_at
      t.references :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
