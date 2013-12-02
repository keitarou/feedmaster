class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.integer :entry_id

      t.timestamps
    end
  end
end
