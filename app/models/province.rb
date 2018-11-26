class Province < ApplicationRecord
    has_many :products
    has_many :product_type, through: :products
end
