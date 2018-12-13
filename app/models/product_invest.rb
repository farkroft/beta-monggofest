class ProductInvest < ApplicationRecord
  belongs_to :product
  has_many :product_invest_details, dependent: false
  has_one :kecamatan, through: :product
  has_one :regional, through: :product
  has_one :province, through: :product
  has_many :gambars, through: :product

  # has_many :regional, through: :product
  # has_one :province, through: :product, source: :regional
end

