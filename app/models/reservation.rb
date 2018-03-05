class Reservation < ApplicationRecord
  belongs_to :space
  belongs_to :user
  validates :start, presence: true
  validates :end, presence: true
  validates :total_cost, presence: true
end
