class StoreController < ApplicationController
  skip_before_filter :authorize

	# List a catalog of the products
	#
	def index
  	@products = Product.order(:title)
		@cart = current_cart
	end
	
end
