class Arrival < ApplicationRecord
	belongs_to :product
	validates :arrival_count, presence:true
	validates :arrival_date, presence:true
end
