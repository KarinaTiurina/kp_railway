class Train < ApplicationRecord
  has_many :ways, dependent: :destroy

  validates :train_type, presence: true
  validates :number_of_seats, presence: true
  validates :price_per_stop, presence: true

  def name_with_initial
    "#{train_type}/#{number_of_seats}/#{price_per_stop}руб."
  end
end
