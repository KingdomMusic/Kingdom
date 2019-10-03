class Product < ApplicationRecord
  has_many :arrivals, dependent: :destroy
  has_many :discs, dependent: :destroy
  accepts_nested_attributes_for :discs, allow_destroy: true
  has_many :songs, through: :discs

  attachment :jacket_image

  belongs_to :artist
  belongs_to :label
  belongs_to :genre

  validates :product_name, presence:true
  validates :cd_type, presence:true
  validates :price, presence:true
  # validates :stock, presence:true
  validates :sell_status, presence:true

  def product_stock
    arrivals_count = self.arrivals.each do |arrrival|
      arrival.arraival_count
    end

    buy = Product.order_items.count

    @stock = arrival_count - buy
  end

end
