class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :video, presence: true
  validates_size_of :video, maximum: 5.megabytes, message: "should be no more than 5 MB"


  has_attached_file :video,
    styles: {medium: { :geometry => "640x480", :format => 'mp4'}},
    processors: [:transcoder]

  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/

  validates_attachment_file_name :video, :matches => /mp4\Z/

  before_save :set_video_length

  private

  def set_video_length
    self.length_in_seconds = eval(self.video_meta)[:duration].ceil
  end
end
