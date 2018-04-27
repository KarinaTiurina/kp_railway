class Ticket < ApplicationRecord
  belongs_to :way
  belongs_to :user

  validates :way, presence: true
  validates :user, presence: true

  validates :user, uniqueness: { scope: :way_id }
end
