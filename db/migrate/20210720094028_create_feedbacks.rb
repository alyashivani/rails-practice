class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :product, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
