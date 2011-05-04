class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :comments
      t.integer :subcategory_id
      t.integer :user_id

      t.timestamps
    end
	add_index :items, :user_id
  end

  def self.down
    drop_table :items
  end
end
