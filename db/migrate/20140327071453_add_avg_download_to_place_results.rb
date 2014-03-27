class AddAvgDownloadToPlaceResults < ActiveRecord::Migration
  def change
    add_column :place_results, :avg_download, :float
  end
end
