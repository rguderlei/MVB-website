class CreateEventLocations < ActiveRecord::Migration
  def change
    create_table :event_locations do |t|
      t.string :short_name
      t.string :long_name
      t.string :street
      t.integer :zipcode
      t.string :city
      t.string :country
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
