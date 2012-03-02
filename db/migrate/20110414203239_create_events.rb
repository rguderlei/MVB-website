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

      t.string :type

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
