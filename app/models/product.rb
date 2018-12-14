class Product < ApplicationRecord

  belongs_to :subdistrict
  belongs_to :regional
  belongs_to :province
  has_many :product_invests, dependent: false


  has_many :gambars, dependent: :destroy
  enum product_type: %i[Sapi Kambing Ayam Bebek Ikan]

 belongs_to :subdistrict
 has_many :pictures
 has_many :product_invests
 has_many :product_invest_details
 

end
