class Province < ApplicationRecord
    has_many :regionals
    has_many :kecamatans, through: :regionals
end
