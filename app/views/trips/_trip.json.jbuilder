json.extract! trip, :name, :destination

json.url trip_url(trip, format: :json)

json.test "hello"
