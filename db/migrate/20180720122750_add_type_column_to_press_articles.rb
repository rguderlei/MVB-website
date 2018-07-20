class AddTypeColumnToPressArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :press_articles , :event_type, :string
  end
end
