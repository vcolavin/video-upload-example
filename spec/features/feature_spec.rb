require "rails_helper"

describe "file upload", :js => true do
  it "has expected content" do
    visit("/")
    expect(page).to have_content("VUE")
    expect(page).to have_content("Index of videos.")

    click_on("Upload a new video.")
    expect(page).to have_content("Upload a new one.")
  end

  it "saves a video" do
    visit("/videos/new")

    fill_in("video_title", with: "test_title")

    page.execute_script("seleniumUpload = window.$('<input/>').attr({id: 'seleniumUpload', type:'file'}).appendTo('body');")

    attach_file('seleniumUpload', Rails.root + 'spec/support/pirate_cat.mp4')

    # Trigger the drop event
    page.execute_script("e = $.Event('drop'); e.originalEvent = {dataTransfer : { files : seleniumUpload.get(0).files } }; $('#video_video').trigger(e);")

    click_on("Upload")

    # the upload takes a while
    sleep 12

    expect(page).to have_content("test_title")
    expect(page).to have_content("length: 22 seconds")
  end

  it "won't save a video without a title" do
    visit("/videos/new")

    page.execute_script("seleniumUpload = window.$('<input/>').attr({id: 'seleniumUpload', type:'file'}).appendTo('body');")

    attach_file('seleniumUpload', Rails.root + 'spec/support/pirate_cat.mp4')

    # Trigger the drop event
    page.execute_script("e = $.Event('drop'); e.originalEvent = {dataTransfer : { files : seleniumUpload.get(0).files } }; $('#video_video').trigger(e);")

    click_on("Upload")

    # the upload takes a while
    sleep 2

    expect(page).to have_content("Title can't be blank")
  end

  it "won't save a non-mp4" do
    visit("/videos/new")

    fill_in("video_title", with: "test_title")

    page.execute_script("seleniumUpload = window.$('<input/>').attr({id: 'seleniumUpload', type:'file'}).appendTo('body');")

    attach_file('seleniumUpload', Rails.root + 'spec/support/developers.mp3')

    # Trigger the drop event
    page.execute_script("e = $.Event('drop'); e.originalEvent = {dataTransfer : { files : seleniumUpload.get(0).files } }; $('#video_video').trigger(e);")

    click_on("Upload")

    # the upload takes a while
    sleep 2

    expect(page).to have_content("Video content type is invalid")
  end
end
