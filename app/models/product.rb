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
end
