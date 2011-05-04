class AddUserToSubcategories < ActiveRecord::Migration
  def self.up
    add_column :subcategories, :user_id, :integer
  end

  def self.down
    remove_column :subcategories, :user_id
  end
end