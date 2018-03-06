class Space < ApplicationRecord
  belongs_to :user
  validates :address, presence: true
  validates :price, presence: true
  validates :parking_type, presence: true, inclusion: ["garage", "drive", "street"]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
