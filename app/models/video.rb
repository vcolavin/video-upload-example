class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :video, presence: true
  validates_with AttachmentSizeValidator, attributes: :video, less_than: 5.megabytes

  has_attached_file :video,
    styles: {medium: { :geometry => "640x480", :format => 'mp4'}},
    processors: [:transcoder]

  validates_attachment_content_type :video, content_type: /\Avideo\/mp4\Z/

  validates_attachment_file_name :video, :matches => /mp4\z/

  before_save :set_video_length

  private

  def set_video_length
    self.length_in_seconds = eval(self.video_meta)[:duration].ceil
  end
end
