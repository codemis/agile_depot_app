class LineItem < ActiveRecord::Base
	# relationships
	#
	belongs_to :cart
	belongs_to :product
end
