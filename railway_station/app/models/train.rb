class Train < ApplicationRecord
  has_many :ways

  validates :train_type, presence: true
  validates :number_of_seats, presence: true
  validates :price_per_stop, presence: true
end
