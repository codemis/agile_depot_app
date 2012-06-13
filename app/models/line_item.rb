class LineItem < ActiveRecord::Base
	# attributes
	#
	attr_accessible :cart_id, :product_id, :quantity
	# relationships
	#
	belongs_to :cart
	belongs_to :product
	belongs_to :order
	
	# get total price
	#
	def total_price
		product.price * quantity
	end
end
