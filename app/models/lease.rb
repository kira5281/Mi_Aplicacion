class Lease < ApplicationRecord
	belongs_to :adviser
	belongs_to :user
end
