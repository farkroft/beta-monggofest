class Product < ApplicationRecord
  belongs_to :subdistrict
  has_many :pictures, dependent: :destroy
  enum product_type: %i[Sapi Kambing Ayam Bebek Ikan]
end
