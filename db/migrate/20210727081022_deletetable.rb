class Deletetable < ActiveRecord::Migration[6.1]
  def change
    drop_table :sports
  end
end
