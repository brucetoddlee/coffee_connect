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

  # def calculate_avg(test_metric)
  #   tests_count = Test.count(:yelp_id)

  #   test_metric_array = Test.where(yelp_id: :yelp_id).map do |el| 
  #     el["test_metric"]
  #   end

  #   avg = (test_metric_array.sum / tests_count).round(1)
  # end

  def show
    id = params[:yelp_id]

    gon._csrf_token = session[:_csrf_token]

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


    tests_count = Test.count(:yelp_id)


    download_array = Test.where(yelp_id: id).map do |el| 
      el["download"]
    end

    avg_download = (download_array.sum / tests_count).round(1)


    upload_array = Test.where(yelp_id: id).map do |el| 
      el["upload"]
    end

    avg_upload = (upload_array.sum / tests_count).round(1)


    latency_array = Test.where(yelp_id: id).map do |el| 
      el["latency"]
    end

    avg_latency = (latency_array.sum / tests_count).round(1)
    

    jitter_array = Test.where(yelp_id: id).map do |el| 
      el["jitter"]
    end

    avg_jitter = (jitter_array.sum / tests_count).round(1)


    @place["tests_count"] = tests_count
    @place["avg_download"] = avg_download
    @place["avg_upload"] = avg_upload
    @place["avg_latency"] = avg_latency
    @place["avg_jitter"] = avg_jitter

  end

end