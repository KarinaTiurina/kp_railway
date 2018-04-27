class Way < ApplicationRecord
  belongs_to :train

  has_many :tickets
  has_many :passengers, through: :tickets, source: :user

  validates :way_number, presence: true, uniqueness: true
  validates :stops_array, presence: true
  validates :departure, presence: true
  validates :arrival, presence: true

  def name_with_initial
    first_stop = stops_array.first
    last_stop = stops_array.last

    "№#{way_number} #{first_stop} - #{last_stop}"
  end
end
