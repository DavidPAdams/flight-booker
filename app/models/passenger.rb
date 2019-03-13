class Passenger < ApplicationRecord
  has_many :reservations
  has_many :flights, through: :reservations
end
