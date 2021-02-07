class Product < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :category, optional: true
	scope :project_title, ->{ map(&:title).compact.join(",") }
end
