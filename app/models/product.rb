class Product < ApplicationRecord
  belongs_to :kecamatan
  has_many :gambars, dependent: :destroy
  enum product_type: %i[Sapi Kambing Ayam Bebek Ikan]
end
