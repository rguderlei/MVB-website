class FixColumnNames < ActiveRecord::Migration
  def up
    rename_column :events, :begin, :start_at
    rename_column :events, :end, :end_at
  end

  def down
  end
end
