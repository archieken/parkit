class Space < ApplicationRecord
  belongs_to :user
  validates :address, presence: true
  validates :price, presence: true
  validates :parking_type, presence: true, inclusion: ["garage", "drive", "street"]
end
