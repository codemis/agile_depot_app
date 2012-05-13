class StoreController < ApplicationController
  
	# List a catalog of the products
	#
	def index
  	@products = Product.order(:title)
	end
	
end
