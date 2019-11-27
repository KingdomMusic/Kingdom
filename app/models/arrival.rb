class Arrival < ApplicationRecord
	default_scope -> { order(arrival_date: :asc) }
	belongs_to :product
	validates :arrival_count, presence:true, numericality: {greater_than: 0}
	validates :arrival_date, presence:true
end
