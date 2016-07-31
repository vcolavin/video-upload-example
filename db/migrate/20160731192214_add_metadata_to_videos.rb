class AddMetadataToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :video_meta, :string
  end
end
