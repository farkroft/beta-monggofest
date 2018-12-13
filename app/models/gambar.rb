class Gambar < ApplicationRecord
  belongs_to :product
  has_many :product_invests
  has_many :product_invest_details
  mount_uploader :photo, PhotoUploader
end
