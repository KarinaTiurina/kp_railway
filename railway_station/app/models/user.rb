class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :ways

  validates :name, presence: true
  validates :last_name, presence: true
  validates :second_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  before_validation :set_role, on: :create


  def full_name
    last_name + " " + name + " " + second_name
  end

  private

  def set_role
    self.role = "_USER_" if self.role.blank?
  end
end
