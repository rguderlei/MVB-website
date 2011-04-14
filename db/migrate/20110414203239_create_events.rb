class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :begin
      t.datetime :end
      t.string :location
      t.string :orchestra
      t.string :title
      t.text :description
      t.boolean :public_event

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
