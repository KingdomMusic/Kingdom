class Product < ApplicationRecord
  has_many :arrivals, dependent: :destroy
  has_many :discs, dependent: :destroy
  accepts_nested_attributes_for :discs, allow_destroy: true
  has_many :songs, through: :discs
  has_many :carts, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :reviews, dependent: :destroy

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
    arrivals_count = 0
    buy = 0

    self.arrivals.each do |a|
      arrivals_count += a.arrival_count
    end

    self.order_items.each do |i|
      buy += i.count
    end

    return arrivals_count - buy
  end

  # controllerに書いても別にいいけど、長くてウザいのでmodelに整理
  # 入荷数 = 商品.入荷.each do |入荷|
  #   処理~~~
  # end

  # 購入数 = 処理~~~

  # @在庫数 = 入荷数 - 購入数

  # ある商品に紐付いた入荷レコード(arrival.id)と購入履歴(cart.count)から在庫数を取得

end
