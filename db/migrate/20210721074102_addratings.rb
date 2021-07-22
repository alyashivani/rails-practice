class Addratings < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :ratings, :integer
  end
end
