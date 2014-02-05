class TestsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  	yelp_id = params[:yelp_id]
  	test = params.require("test").permit(:download, :upload, :latency, :jitter, :test_server, :IP, :hostname)
  	test[:yelp_id] = yelp_id	
  	Test.create(test)

  	redirect_to root_path
  end
end
