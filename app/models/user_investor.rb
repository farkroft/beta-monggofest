class UserInvestor < ApplicationRecord
    belongs_to :product_invest
    belongs_to :user
end
