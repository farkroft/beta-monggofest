class Regional < ApplicationRecord
  belongs_to :province
  has_many :kecamatans
end
