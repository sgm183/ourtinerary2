class RemoveBooleanFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :boolean
  end
end
