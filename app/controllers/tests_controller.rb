class TestsController < ApplicationController

  def create
  	yelp_id = params[:yelp_id]
  	test = params.require("test").permit(:download, :upload, :latency, :jitter, :test_server, :IP, :hostname)
  	test[:yelp_id] = yelp_id	
  	Test.create(test)

    flash[:notice] = "Your speed test has been included. Thanks!"

  	redirect_to "/#{yelp_id}"
  end

end
