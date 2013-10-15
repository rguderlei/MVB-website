class AddEventLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_location_id, :integer
    add_index :events, :event_location_id
  end
end
