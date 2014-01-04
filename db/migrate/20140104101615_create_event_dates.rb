class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
      t.integer :event_location_id
      t.integer :event_id

      t.timestamps
    end

    update <<-SQL
       insert into event_dates
        (start_at, end_at, location, event_location_id, event_id, created_at, updated_at)
        select start_at, end_at, location, event_location_id, id, created_at, updated_at from events
    SQL

    remove_column :events, :start_at
    remove_column :events, :end_at
    remove_column :events, :location
    remove_column :events, :event_location_id

  end
end
