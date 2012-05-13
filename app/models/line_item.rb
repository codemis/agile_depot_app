class LineItem < ActiveRecord::Base
	# attributes
	#
	attr_accessible :product, :cart
	# relationships
	#
	belongs_to :cart
	belongs_to :product
end
