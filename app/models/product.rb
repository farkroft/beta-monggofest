class Product < ApplicationRecord
  belongs_to :province
  belongs_to :product_type
end
