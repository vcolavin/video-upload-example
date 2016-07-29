class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :video, presence: true
  validates_size_of :video, maximum: 1000.kilobytes, message: "should be no more than 1 MB"


  has_attached_file :video
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
  validates_attachment_file_name :video, :matches => /mp4\Z/
end
