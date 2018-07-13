class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(@track.album_id)
    else
      flash[:error] = @track.errors.full_messages
      redirect_to new_album_track_url
    end
  end

  def destroy
    @track = Track.find(params[:id])
    if @track
      @track.destroy
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = ["You tried to delete a non-existing track!"]
      redirect_to album_url(@track.album_id)
    end

  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])

    if @track.update_attributes(track_params)
      redirect_to album_url(@track.album_id)
    else
      redirect_to edit_track_url
    end
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :bonus)
  end

end
