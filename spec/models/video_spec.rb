require "rails_helper"

describe Video do
  it { should have_attached_file(:video) }

  it { should validate_attachment_presence(:video) }
  it { should validate_attachment_content_type(:video).
                allowing('video/mp4')}
  it { should validate_attachment_size(:video).
                less_than(5.megabytes) }
  it { should validate_presence_of(:title)}
end
