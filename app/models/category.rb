class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	has_many :users, through: :products
	accepts_nested_attributes_for :products, allow_destroy: true
	scope :category_name, ->{ map(&:name).compact.join(",") }
	
end
