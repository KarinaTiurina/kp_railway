class Train < ApplicationRecord
  validates :type, presence: true
  validates :number_of_seats, presence: true
  validates :price_per_stop, presence: true
end
