class PlacesController < ApplicationController
 
  def index
  	consumer_key = '5iQ5iCur5SWs9R9uPsu-1Q'
  	consumer_secret = 'HBadDsFa_4fd_jgxDgeCy8xaAyQ'
  	token = 'aJlK9VnVGifUax-MQQZOaRqrhlTu60AG'
  	token_secret = 'B8t5DXfEv-j04U7PqsJrYVJjZkk'

  	api_host = 'api.yelp.com'

  	consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
  	access_token = OAuth::AccessToken.new(consumer, token, token_secret)

  	path = "/v2/search?term=coffee+shop&location=94109"

  	@api_request = access_token.get(path).body
  	# @search_results = JSON.parse(api_request)
  	# binding.pry
  	render "places/index.html.erb"
  end

  # route: # GET    /places/:id(.:format)
  def show
    # @place = @@place_db.find do |m|
    #   m["yelp_id"] == params[:id]
    # end
    # if @place.nil?
    #   flash.now[:message] = "Place not found"
    #   @place = {}
    # end
  end

end