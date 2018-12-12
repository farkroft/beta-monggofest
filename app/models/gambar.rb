class Gambar < ApplicationRecord
  belongs_to :product
  has_many :product_invest
  mount_uploader :photo, PhotoUploader
end
