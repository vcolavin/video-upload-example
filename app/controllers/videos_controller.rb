class VideosController < ApplicationController
  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(video_params)

    redirect_to videos_path
  end

  def delete
  end

  private
  def video_params
    params.require(:video).permit(:video, :title)
  end
end