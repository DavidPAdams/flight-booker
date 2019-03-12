class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  

  def departure_formatted
    departure_time.strftime("%a %d %b %Y at %I:%M %P")
  end
end
