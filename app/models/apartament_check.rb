class ApartmentCheck < ApplicationRecord
    belongs_to :apartment

    enum status: { pending: 0, approved: 1, rejected: 2 }
end