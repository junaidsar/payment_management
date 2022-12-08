class CreateTableEvent < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :eventable_id, null: false
      t.string :eventable_type, null: false
      t.string :name, null: false
      t.json :transition, null: false
      t.json :metadata

      t.timestamps
    end
    Event.reset_column_information
    add_index :events, :eventable_id
    add_index :events, :eventable_type
    add_index :events, :name
    add_index :events, :transition
    add_index :events, :metadata
  end
end
