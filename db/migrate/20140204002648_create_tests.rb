class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :yelp_id
      t.float :download
      t.float :upload
      t.float :latency
      t.float :jitter
      t.string :test_server
      t.string :IP
      t.string :hostname

      t.timestamps
    end
  end
end
