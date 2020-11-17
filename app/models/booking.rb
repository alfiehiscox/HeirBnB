class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :castle
  validates :start_date, :end_date, presence: true
end
