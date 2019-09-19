class Product < ApplicationRecord
  has_many :artists, dependent: :destroy
  has_many :labels, dependent: :destroy
  has_many :genres, dependent: :destroy

  # attachment :jacket_image
end
