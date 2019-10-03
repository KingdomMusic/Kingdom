class Order < ApplicationRecord
	has_many :order_item, dependent: :destroy
	belongs_to :user
	# belongs_to :destination
end
