class Product < ApplicationRecord
    belongs_to :product_type
    belongs_to :province
end