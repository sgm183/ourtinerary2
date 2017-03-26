class AddColumnsToTripitems < ActiveRecord::Migration[5.0]
  def change
    add_column :tripitems, :date, :date
    add_column :tripitems, :cost, :integer
    add_column :tripitems, :location, :string
    add_column :tripitems, :pocname, :string
    add_column :tripitems, :pocphone, :string
    add_column :tripitems, :creatorcomment, :string

  end
end
