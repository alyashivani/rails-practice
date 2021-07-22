class Addfield < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :approve, :boolean 
  end
end
