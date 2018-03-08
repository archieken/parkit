class Space < ApplicationRecord
  belongs_to :user
  validates :address, presence: true
  validates :price, presence: true
  validates :parking_type, presence: true, inclusion: ["garage", "public drive", "street", "private drive"]
  has_one :reservation, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?




  def self.return_address(lat, long)
    latitude = lat
    longitude = long
    geo_localization = "#{latitude},#{longitude}"
    query = Geocoder.search(geo_localization).first
    return query.address
  end


end
