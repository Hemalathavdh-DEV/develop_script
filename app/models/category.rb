class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	has_many :users, through: :products
	scope :category_name, ->{ pluck(:name).join(",") }
	
end
