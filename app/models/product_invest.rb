class ProductInvest < ApplicationRecord
  belongs_to :product
  has_many :product_invest_detail
end
