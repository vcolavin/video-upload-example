# Hey.
Welcome to my video upload app.

## Installation
- As with any Rails app, getting Capybara to work is the hardest part.
- And sometimes Postgres is a pain too.
- In theory, all you should need is
  - `bundle`
  - `rake db:create db:seed`
  - `rspec spec`
  - `rails s`

## Checklist
- A user needs to be able to upload videos to the web application server
- The uploader should only be able to upload the mp4 file types
- All other file types should be blocked
- After the video has been uploaded, the user should be able to replay this video from the web application
- It should show a progress bar to the user as they are uploading with the percentage completed and the estimated time
- As a user uploads videos, the videos should show and be paginated in sections of 5
- The videos should give some meta data such as length, format, name of video, etc.
- Unit and integration tests should be created