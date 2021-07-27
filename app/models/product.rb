class Product < ApplicationRecord
	has_one_attached :avatar

	has_many :cart_items

	has_many :feedbacks

	#has_many :variants, inverse_of: :product, :dependent => :destroy
    #accepts_nested_attributes_for :variants, allow_destroy: true, reject_if: :all_blank

  has_many :product_variants, dependent: :destroy

  accepts_nested_attributes_for :product_variants, allow_destroy: true, reject_if: :all_blank
    
end
