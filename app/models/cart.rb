class Cart < ActiveRecord::Base
	# relationships
	#
	has_many :line_items, dependent: :destroy
	
	# add a product to the cart
	#
	def add_product(product_id)
		current_item = line_items.find_by_product_id(product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end
	
	# get grand total of cart
	#
	def total_price
		line_items.to_a.sum { |item| item.total_price}
	end
	
end
