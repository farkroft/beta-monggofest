class ProductInvest < ApplicationRecord
  belongs_to :product
  has_many :product_invest_details
  has_many :pictures, through: :product
end