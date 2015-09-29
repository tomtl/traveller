require "faraday"
require "json"
require_relative "middleware/json_parsing"

module ExpediaAPI
  
  Hotel = Struct.new(:id)
  
  class Client
    def intialize(token)
      @token = token
    end
    
    def region_id(city_name)
      url = "http://terminal2.expedia.com/x/suggestions/regions?query=#{city_name}&apikey=ENV['EXPEDIA_KEY']"
      
      response = connection.get(url)
      
      data = response.body
      hotels_data = data["trendResult"]["popularHotelsForRegionData"]["popularHotelDetails"]
      
      hotels = hotels_data.map do |hotel|
        Hotel.new(hotel["hotelId"])
      end
    end
    
    def popular_hotels(region_id)
      url = "http://terminal2.expedia.com/x/suggestions/regions?query=#{city_name}&apikey=ENV['EXPEDIA_KEY']"
      
      response = connection.get(url)
      
      data = response.body
      hotels_data = data["trendResult"]["popularHotelsForRegionData"]["popularHotelDetails"]
      
      hotels = hotels_data.map do |hotel|
        Hotel.new(hotel["hotelId"])
      end
    end
    
    def connection
      @connection ||= Faraday::Connection.new do |builder|
        builder.use Middleware::JSONParsing
        builder.adapter Faraday.default_adapter
      end
    end
  end
end