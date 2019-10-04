class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :review, dependent: :destroy

  attachment :profile_image

  def full_name(user)
    user.first_name_characters + user.last_name_characters
  end

end
