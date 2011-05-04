class CreateSubcategories < ActiveRecord::Migration
  def self.up
    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
	 add_index :subcategories, :category_id
  end

  def self.down
    drop_table :subcategories
  end
end
