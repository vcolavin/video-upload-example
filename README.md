# Hey.
Welcome to my video upload example, aka VUE.
Now that it's got a fancy name, I can't wait for all the VC money to roll in!

## Installation
- In theory, all you should need is
  - `bundle`
  - `rake db:create db:seed`
  - `rspec spec`
  - `rails s`
- As with any Rails app, getting Capybara to work is the hardest part.
- There may be some trouble with the paperclip-av-transcoder gem, which relies on ffmpeg being installed locally. I don't know the magic words for getting it working, but that is likely going to be a pain point.

## Checklist
- A user needs to be able to upload videos to the web application server
- The uploader should only be able to upload the mp4 file types
- All other file types should be blocked
- After the video has been uploaded, the user should be able to replay this video from the web application
- It should show a progress bar to the user as they are uploading with the percentage completed and the estimated time
- As a user uploads videos, the videos should show and be paginated in sections of 5
- The videos should give some meta data such as length, format, name of video, etc.
- Unit and integration tests should be created


## Known Issues
- Uploading takes a very long time. This is because videos are encoaded with paperclip-av-transcoder. Before this gem was added, the upload was almost instant, but by transcoding, I am able to get the MP4's length in seconds. I think there must be a way to avoid this.
- The "choose file" dialog always says "no file chosen"
- You can't upload a non-MP4 file from the file explorer, but you can drag any file you want onto it.
- The logo is so cool.