class Product < ApplicationRecord
	has_one_attached :avatar

	has_many :cart_items

	has_many :feedbacks
end
