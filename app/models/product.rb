class Product < ApplicationRecord
  belongs_to :kecamatan
  belongs_to :regional
  belongs_to :province
  has_many :product_invests, dependent: false
  # has_many :regional, through: :kecamatan
end
