class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.text :orchestra
      t.text :header
      t.text :footer

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
