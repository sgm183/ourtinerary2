class AddAdmiToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, dafault: false
  end
end
