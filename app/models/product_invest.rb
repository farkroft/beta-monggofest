class ProductInvest < ApplicationRecord
  belongs_to :product

  has_one :product_invest_details, dependent: false
  has_one :subdistrict, through: :product
  has_one :regional, through: :product
  has_one :province, through: :product
  has_many :pictures, through: :product

  # has_many :regional, through: :product
  # has_one :province, through: :product, source: :regional
end
