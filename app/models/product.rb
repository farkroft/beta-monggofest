class Product < ApplicationRecord
  belongs_to :kecamatan
<<<<<<< HEAD
  belongs_to :regional
  belongs_to :province
  has_many :product_invests, dependent: false
  # has_many :regional, through: :kecamatan
=======
  has_many :gambars, dependent: :destroy
  enum product_type: %i[Sapi Kambing Ayam Bebek Ikan]
>>>>>>> 5bbe61a964433563dc8ad2d0d884314164abd829
end
