class Product < ApplicationRecord
<<<<<<< HEAD
  belongs_to :subdistrict
  has_many :pictures, dependent: :destroy
  enum product_type: %i[Sapi Kambing Ayam Bebek Ikan]
=======
  belongs_to :kecamatan
  belongs_to :product_type
  has_many :product_invests
  #has_many :regional, through: :kecamatan
>>>>>>> 815941e9e3f23d1bac59a9006bab048686cead55
end
