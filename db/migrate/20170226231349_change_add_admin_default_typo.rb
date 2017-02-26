class ChangeAddAdminDefaultTypo < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :admin, :boolean
  end
end
