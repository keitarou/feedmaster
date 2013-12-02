class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :feedurl
      t.string :title
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
