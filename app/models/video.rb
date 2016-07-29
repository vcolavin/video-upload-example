class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :video, presence: true

  has_attached_file :video
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
  validates_attachment_file_name :video, :matches => /mp4\Z/
end
