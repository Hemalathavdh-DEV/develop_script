class Product < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :category, optional: true
	scope :project_title, ->{ pluck(:title).join(",") }
end
