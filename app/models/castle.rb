class Castle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy
  validates :name, :address, :price_per_night, presence: true
  has_one_attached :photo
end
