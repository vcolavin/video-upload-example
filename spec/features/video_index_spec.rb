require "rails_helper"

describe "video index / root", :js => true do
  it "has expected content" do
    add_5_videos!

    visit("/")
    expect(page).to have_content("videos index")

    visit("/videos")
    expect(page).to have_content("videos index")
    # expect(page).to # have 5 videos

    add_5_videos!
    visit("/videos")
    # expect(page).to # have 5 videos
    expect(page).to have_content("more videos")

    click("more videos")
  end
end
