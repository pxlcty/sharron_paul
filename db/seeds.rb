# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def time_rand from = 0.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
  end

  event_list = [
    ["My headline", 
    "this is a very long description of text", 
    "The Local Pub", 
    "https://www.thewaystationbk.com/", 
    time_rand, 
    "this is a shorter description of words", 
    "https://www.ticketmaster.com/", 
    "https://g.page/unionhallny?share",
    "333 Main Street", 
    "Brooklyn", 
    "11123", 
    "NY", 
    "USA" ]
]

event_list.each do |headline, d_long, location_name, location_url, image_url, time, d_short, tickets_url, map_url, location_street, location_city, location_zip, location_state, location_country|
    temp = Event.create(headline: headline, 
                description_long: d_long, 
                location_name: location_name, 
                location_url: location_url, 
                time: time, 
                description_short: d_short, 
                tickets_url: tickets_url, 
                map_url: map_url, 
                location_street: location_street,
                location_city: location_city,
                location_zip: location_zip,
                location_state: location_state,
                location_country: location_country
    )
    temp.save
end

