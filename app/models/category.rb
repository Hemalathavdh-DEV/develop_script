class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	has_many :users, through: :products
end
