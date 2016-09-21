class StoresService

  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com/v1")
  end

  def all_by(params)
    response = connection.get("stores(area(#{params[:zipcode]},25))",
                              {apiKey: "#{ENV['best_buy_api_key']}",
                              format: 'json'})

    parse(response.body)
  end

  private
    def connection
      @_connection
    end

    def parse(response_body)
      JSON.parse(response_body, symbolize_names: true)
    end
end
