class ProductType < ApplicationRecord
    has_many :products
    has_many :province, through: :products
end
