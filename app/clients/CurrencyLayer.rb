require 'net/http'

class WeatherClient
  API_KEY = '7dff9e16205722fd1f4883b8922f4779'
  
  def self.get_weather(source, currencies)
    currencies_str = currencies.join(', ')
    uri = URI("http://apilayer.net/api/live?access_key=#{API_KEY}&currencies=#{currencies_str}&source=#{source}&format=1")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end