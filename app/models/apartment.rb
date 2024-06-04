class Apartment < ApplicationRecord
    belongs_to :building
    # has_one :apartment_check, dependent: :destroy
end