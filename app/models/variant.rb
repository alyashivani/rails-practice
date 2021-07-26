class Variant < ApplicationRecord
	has_many :variant_attributes, inverse_of: :variant, :dependent => :destroy
    accepts_nested_attributes_for :variant_attributes, allow_destroy: true, reject_if: :all_blank


    belongs_to :products


    has_many :product_variants
end
