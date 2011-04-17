class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      # Event attributes
      t.datetime :begin
      t.datetime :end
      t.string :location
      t.string :orchestra
      t.string :title
      t.text :description
      t.boolean :public_event
      # concert attributes
      t.text :announcement
      t.text :critique

      t.string :type


      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
