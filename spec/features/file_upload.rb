require "rails_helper"

describe "when user drops MP4", :js => true do
  # When it comes time to actually implement these tests, check out the following link:
  # http://stackoverflow.com/questions/5188240/using-selenium-to-imitate-dragging-a-file-onto-an-upload-element/11203629#11203629

  it "has expected content" do
    binding.pry
    visit "/"
    expect(page).to have_content("Welcome aboard")
  end

  it "doesn't accept a dragged non-mp4 file"
  it "accepts the dragged MP4 with meta-data"
  it "has a progress bar"
  it "completes upload"
end