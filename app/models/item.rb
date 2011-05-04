class Item < ActiveRecord::Base
	attr_accessible :name, :comments, :subcategory_id
	
	belongs_to :subcategory
	belongs_to :user
	belongs_to :category
	
	validates :user_id, :presence => true
end