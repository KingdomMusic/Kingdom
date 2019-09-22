class Arrival < ApplicationRecord
	belongs_to :product
	validates :arraival_count, presence:true
end
