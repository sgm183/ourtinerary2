class ChangeTypeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tripitems, :type, :itemtype
  end
end
