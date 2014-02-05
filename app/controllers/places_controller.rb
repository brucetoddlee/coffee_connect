class PlacesController < ApplicationController
 
  def index
  	consumer_key = '5iQ5iCur5SWs9R9uPsu-1Q'
  	consumer_secret = 'HBadDsFa_4fd_jgxDgeCy8xaAyQ'
  	token = 'aJlK9VnVGifUax-MQQZOaRqrhlTu60AG'
  	token_secret = 'B8t5DXfEv-j04U7PqsJrYVJjZkk'

  	api_host = 'api.yelp.com'

  	consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
  	access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/search?term=coffee+shop&location=#{params[:zip_code]}"

  	api_request = access_token.get(path).body
  	@results = JSON.parse(api_request)
  	render "places/index.html.erb"
  end

  def show
    id = params[:yelp_id]

    consumer_key = '5iQ5iCur5SWs9R9uPsu-1Q'
    consumer_secret = 'HBadDsFa_4fd_jgxDgeCy8xaAyQ'
    token = 'aJlK9VnVGifUax-MQQZOaRqrhlTu60AG'
    token_secret = 'B8t5DXfEv-j04U7PqsJrYVJjZkk'

    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/business/#{params[:yelp_id]}"

    api_request_by_id = access_token.get(path).body
    @place = JSON.parse(api_request_by_id) 
  end

end