require "faraday"

module ExpediaAPI
  class Client
    def intialize(token)
      @token = token
    end
    
    def region_id(city_name)
      url = "http://terminal2.expedia.com/x/suggestions/regions?query=#{city_name}&apikey=ENV['EXPEDIA_KEY']"
      
      response = connection.get(url)
      
      data = response.body
    end
    
    def popular_hotels(region_id)
      
    end
    
    def connection
      @connection ||= Faraday::Connection.new do |builder|
        builder.use Middleware::JSONParsing
        builder.adapter Faraday.default_adapter
      end
    end
  end
end