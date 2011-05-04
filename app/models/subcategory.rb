class Subcategory < ActiveRecord::Base
	belongs_to :category
	has_many :items
	belongs_to :user
end
