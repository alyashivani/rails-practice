class Addmorefields < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phoneNumber, :integer
    add_column :users, :gender, :string
    add_column :users, :dateBirth, :date
  end
end
