class Product < ApplicationRecord
  belongs_to :kecamatan
  belongs_to :regional
  belongs_to :province
  belongs_to :product_type
  has_many :product_invests
  #has_many :regional, through: :kecamatan
end
