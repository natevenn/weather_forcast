require 'faraday'
require 'json'

city = ARGV

response = Faraday.get("http://api.openweathermap.org/data/2.5/forecast?q=#{city.join "%20"},us&units=imperial&APPID=442eba5b3e3a3ae8ead5698479bcdaa8")

raw_data = response.body

data = JSON.parse(raw_data)

data['list'].each do |data|
  puts "#{data['dt_txt']} -- #{data['main']['temp']} degrees"
end
