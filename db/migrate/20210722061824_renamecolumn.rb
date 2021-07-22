class Renamecolumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :variants, :type, :productType
  end
end
