class Way < ApplicationRecord
  belongs_to :train

  validates :way_number, presence: true, uniqueness: true
  validates :stops_array, presence: true
  validates :departure, presence: true
  validates :arrival, presence: true
end
