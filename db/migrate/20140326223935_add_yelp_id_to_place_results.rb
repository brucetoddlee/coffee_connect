class AddYelpIdToPlaceResults < ActiveRecord::Migration
  def change
    add_column :place_results, :yelp_id, :string
    add_index :place_results, :yelp_id
  end
end
