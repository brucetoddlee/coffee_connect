class PlaceResults < ActiveRecord::Base
  
  def concat_full_address
    self.full_address = "#{address}, #{city}, #{state}"
  end

  geocoded_by :full_address
  after_validation :geocode

  def calc_avg_download

    tests_count = Test.where(yelp_id: self.yelp_id).count
      if tests_count == 0
        self.avg_download = "-"
      else
        download_array = Test.where(yelp_id: self.yelp_id).map do |el| 
          el["download"]
        end
        avg_download = (download_array.sum / tests_count).round(1)
        self.avg_download = avg_download
      end

  end

end
