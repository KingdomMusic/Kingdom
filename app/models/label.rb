class Label < ApplicationRecord
	belongs_to :product
	validates :name, presence:true
end
