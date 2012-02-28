class CreatePressArticles < ActiveRecord::Migration
  def change
    create_table :press_articles do |t|
      t.string :title
      t.date :print_date
      t.string :publisher

      t.references :event

      t.string :article_file_name
      t.string :article_content_type
      t.integer :article_file_size
      t.datetime :article_updated_at

      t.timestamps
    end
  end
end
