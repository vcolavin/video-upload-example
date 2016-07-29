class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.attachment  :video
      t.string      :title
      t.string      :format
      t.integer     :length_in_seconds

      t.timestamps null: false
    end
  end
end
