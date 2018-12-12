class Regional < ApplicationRecord
  belongs_to :province
  has_many :kecamatan, dependent: false
  has_many :kecamatans, dependent: false
end
