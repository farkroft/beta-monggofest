class ProductInvest < ApplicationRecord
  belongs_to :product
  has_many :product_invest_details
  has_one :subdistrict, through: :product
end