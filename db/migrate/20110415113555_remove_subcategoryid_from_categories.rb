class RemoveSubcategoryidFromCategories < ActiveRecord::Migration
  def self.up
    remove_column :categories, :subcategory_id
  end

  def self.down
    add_column :categories, :subcategory_id, :integer
  end
end
