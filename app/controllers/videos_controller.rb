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
      json_response = {
        videoId: @video.id,
        videoUrl: url_for(@video)
      }.to_json
      render(json: json_response, content_type: request.format)
    else
      render(json: @video.errors.full_messages.to_json, status: 400, content_type: request.format)
    end
  end

  def delete
  end

  def show
    @video = Video.find(params[:id])
  end

  private
  def video_params
    params.require(:video).permit(:video, :title)
  end
end