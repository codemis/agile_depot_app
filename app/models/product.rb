class Product < ActiveRecord::Base
  # attributes
	#
	attr_accessible :description, :image_url, :price, :title
	
	# validations
	#
	validates :title, :description, :image_url, presence: true
	
	# Validate the price is .01 or greater
	#
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	
	# validate title is unique
	#
	validates :title, uniqueness: true
	
	# validate the url for the image
	#
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)$}i,
		message: 'must be a URL for GIF, JPG, or PNG image.'
	}
	
	# relationships
	#
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	
	private
		# ensures that there are no line items referencing this product
		#
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line item present')
				return false
			end
		end
end
