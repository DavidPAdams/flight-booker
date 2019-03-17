class Reservation < ApplicationRecord
  belongs_to :flight
  has_many :passengers, inverse_of: :reservation

  accepts_nested_attributes_for :passengers
end
