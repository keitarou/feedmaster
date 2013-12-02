class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :feed_id
      t.string :title
      t.string :author
      t.string :link
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
