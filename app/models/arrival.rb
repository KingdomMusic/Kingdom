class Arrival < ApplicationRecord
	belongs_to :product
	validates :arrival_count, presence:true
end
