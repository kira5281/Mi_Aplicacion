class Sale < ApplicationRecord
	belongs_to :adviser
	belongs_to :user

	def display_current_month
  		created_at.strftime('%-b, %Y')
  	end
end
