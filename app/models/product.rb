class Product < ApplicationRecord
 belongs_to :subdistrict
 has_many :pictures
 has_many :product_invests
 has_many :product_invest_details, through: :product_invests
 enum producttype: %i[Sapi Kambing Ayam Bebek Ikan]
end
