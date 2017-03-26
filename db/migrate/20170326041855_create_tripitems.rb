class CreateTripitems < ActiveRecord::Migration[5.0]
  def change
    create_table :tripitems do |t|
      t.string :name
      t.string :type
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
