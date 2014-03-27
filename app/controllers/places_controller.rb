class PlacesController < ApplicationController
 
  include Yelp::V2::Search::Request

  def create
    search_params = params.require(:query).permit(:zipcode)

    PlaceResults.all.each do |record|
      record.destroy
    end 

    client = Yelp::Client.new

    request = Location.new(
      term: "coffee shop",
      # attrs: "WiFi.free",
      zipcode: search_params[:zipcode]
      # latitude: 37.782093,
      # longitude: -122.483230
    )

    response = client.search(request)

    response["businesses"].each do |p|
      result = PlaceResults.create(
        yelp_id: p["id"],
        name: p["name"],
        address: p["location"]["address"].first,
        city: p["location"]["city"],
        state: p["location"]["state_code"],
        phone: p["display_phone"],
        website: p["url"],
        logo: p["image_url"],
        rating_img: p["rating_img_url"]
      )
      result.concat_full_address
      result.calc_avg_download
      result.save
    end

    results = PlaceResults.all

    respond_to do |f|
      f.json { render :json => results, only: [:id, :name, :full_address, :website, :logo, :rating_img, :latitude, :longitude, :yelp_id, :avg_download] }
    end

  end

  def show
    id = params[:yelp_id]

    gon._csrf_token = session[:_csrf_token]

    consumer_key = ENV['YELP_CONSUMER_KEY']
    consumer_secret = ENV['YELP_CONSUMER_SECRET']
    token = ENV['YELP_TOKEN']
    token_secret = ENV['YELP_TOKEN_SECRET']

    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/business/#{params[:yelp_id]}"

    api_request_by_id = access_token.get(path).body
    @place = JSON.parse(api_request_by_id)

    tests_count = Test.where(yelp_id: id).count

    if tests_count == 0
      avg_download = "-"
      avg_upload = "-"
      avg_latency = "-"
      avg_jitter = "-"
    
    else

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

    end

    @place["tests_count"] = tests_count
    @place["avg_download"] = avg_download
    @place["avg_upload"] = avg_upload
    @place["avg_latency"] = avg_latency
    @place["avg_jitter"] = avg_jitter

    @google_maps_address = @place["location"]["display_address"][0].gsub(" ", "+") + "+" + @place["location"]["postal_code"]
  
  end
  
end 