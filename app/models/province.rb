class Province < ApplicationRecord
  has_many :regionals, dependent: false
  has_many :kecamatans, through: :regionals
end
