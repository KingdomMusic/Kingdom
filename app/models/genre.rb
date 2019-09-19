class Genre < ApplicationRecord
	belongs_to :product
	validates :name, presence:true
end
