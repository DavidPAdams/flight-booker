class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.available_flights(depart_from, arrive_to)
    Flight.where(departure_airport_id: depart_from)
          .where(arrival_airport_id: arrive_to)
  end

  def self.date_list(depart, arrive)
    dates = Flight.available_flights(depart, arrive).order(departure_time: :asc)
    dates.map {|n| n.departure_time.strftime("%a %d %b %Y at %I:%M %P") }
  end  

end
