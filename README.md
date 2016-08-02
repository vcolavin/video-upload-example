![VUI Logo](http://i.imgur.com/D5a6VFy.png)

Welcome to my video upload example, VUE. Pronounced as screenreaders interpret it: "Veeyoui".

## Installation
- In theory, all you should need is
  - `bundle`
  - `rake db:create`
  - `rspec spec`
  - `rails s`
- As with any Rails app, getting Capybara to work is the hardest part.
- There may be some trouble with the paperclip-av-transcoder gem, which relies on ffmpeg being installed locally. I don't know the magic words for getting it working, but that is a possible pain point.

## Known Issues
- Uploading takes a very long time. This is because videos are encoaded with paperclip-av-transcoder. Before I added this gem, the upload was almost instant, but by transcoding, I am able to get the MP4's length in seconds.
  - As a direct result of this, feature tests take way too long as well.
- The "choose file" dialog shows "no file chosen" even when one is chosen.
- The upload bar and seconds remaining features are very jerky and unhelpful.
- The logo is so cool.