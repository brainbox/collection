class Category < ActiveRecord::Base
	has_many :subcategory
	belongs_to :user
end
