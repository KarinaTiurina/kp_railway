class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :last_name, presence: true
  validates :second_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :password, presence: true

  before_validation :set_role, on: :create

  private

  def set_role
    self.role = "_USER_" if self.role.blank?

  end
end
