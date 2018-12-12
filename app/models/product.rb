class Product < ApplicationRecord
  belongs_to :kecamatan
  belongs_to :regional
  belongs_to :province
  has_many :product_invests, dependent: false
  # has_many :regional, through: :kecamatan

  has_many :gambars, dependent: :destroy
  enum product_type: %i[Sapi Kambing Ayam Bebek Ikan]
end
