class VideosController < ApplicationController
  def index
    @videos = Video.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      render(json: "hey".to_json, content_type: request.format)
    end
  end

  def delete
  end

  private
  def video_params
    params.require(:video).permit(:video, :title)
  end
end