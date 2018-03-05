class Space < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
 # need validation so that dates for the same space cannot overlap.
end
