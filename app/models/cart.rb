class Cart < ActiveRecord::Base
	# relationships
	#
	has_many :line_items, dependent: :destroy
end
