class Adviser < ApplicationRecord
	has_many :sales
	has_many :leases
	belongs_to :user
end
