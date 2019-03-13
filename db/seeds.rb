# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airport_array = [["JFK", "NYC John F Kennedy International Airport"],
                 ["ABQ", "Albuquerque International Sunport"],
                 ["ANC", "Ted Stevens Anchorage International Airport"],
                 ["BOS", "Boston Logan International Airport"],
                 ["BNA", "Nashville International Airport"],
                 ["CLT", "Charlotte Douglas International Airport"],
                 ["DCA", "Ronald Reagan Washington National Airport"],
                 ["DFW", "Dallas Fort Worth International Airport"],
                 ["HNL", "Honolulu International Airport"],
                 ["IAH", "George Bush Intercontinental Airport"],
                 ["LAS", "Las Vegas McCarran International Airport"],
                 ["LAX", "Los Angeles International Airport"],
                 ["MIA", "Miami International Airport"],
                 ["ORD", "Chicago O'Hare International Airport"],
                 ["PHX", "Phoenix Sky Harbor International Airport"],
                 ["SAN", "San Diego International Airport"],
                 ["SFO", "San Francisco International Airport"],
                 ["SJU", "San Juan PR Luis Munoz Marin International Airport"],
                 ["SLC", "Salt Lake City International Airport"],
                 ["STT", "Cyril E King Airport"],
                 ["STX", "Henry E Rohlson Airport"]]

airport_array.each do |place|
  Airport.create!(code: place[0], name: place[1])
end

5.times do
  21.times do |i|
    21.times do |j|
      if i != j
        Flight.create!(departure_airport_id: i+1,
                       arrival_airport_id: j+1,
                       departure_time: rand(5000..30000).minutes.from_now,
                       duration: rand(100..600))
      end
    end
  end
end
