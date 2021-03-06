Flight.delete_all
# ActiveRecord::Base.connection.
#   execute("DELETE from sqlite_sequence where name = 'flights'")
airport_id = (1..13).to_a
times = ["8:00 am", "10:00 am", "12:00 pm", "2:00 pm",
         "4:00 pm", "6:00 pm", "9:00 pm"]
def set_airport(id)
  from_airport = id.sample
  to_airport = id.sample
  while from_airport == to_airport
    from_airport = id.sample
    to_airport = id.sample
  end
  [from_airport, to_airport]
end

def set_flight(id, times)
  duration = (1..14).to_a.sample
  date = Time.at(Time.now + 24 * 3600 * rand(11..15))
  airports = set_airport(id)
  { from_airport_id: airports[0], to_airport_id: airports[1],
    duration: duration, date: date, time: times.sample }
end
2000.times do
  Flight.create(set_flight(airport_id, times))
end
Airport.delete_all
# ActiveRecord::Base.connection.
#   execute("DELETE from sqlite_sequence where name = 'airports'")
Airport.create(name: "Munich International", city: "Germany")
Airport.create(name: "Miami International", city: "Florida")
Airport.create(name: "Kuala Lumpur International", city: "Malaysia")
Airport.create(name: "San Francisco International", city: "Califonia")
Airport.create(name: "J. F. Kennedy International", city: "New york")
Airport.create(name: "Madrid Barajas International", city: "Madrid")
Airport.create(name: "Beijing Capital International", city: "Beijing")
Airport.create(name: "London Heathrow", city: "London")
Airport.create(name: "Tokyo International", city: "Tokyo")
Airport.create(name: "Dubai International", city: "Dubai")
Airport.create(name: "Amsterdam Schiphol", city: "Amsterdam")
Airport.create(name: "Murtala International", city: "Lagos")
Airport.create(name: "Nnamdi Azikwe International", city: "Abuja")
