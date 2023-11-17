require 'net/http'

class CurrencyLayer
  API_KEY = '7dff9e16205722fd1f4883b8922f4779'
  
  def self.get_conversion_rates(source, currencies)
    uri = URI("http://apilayer.net/api/live?access_key=#{API_KEY}&currencies=#{currencies}&source=#{source}&format=1")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end