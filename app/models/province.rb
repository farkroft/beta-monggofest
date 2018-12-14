class Province < ApplicationRecord
  has_many :regionals, dependent: false
  has_many :subdistcricts, through: :regionals
end
