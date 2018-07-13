class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash[:error] = @album.errors.full_messages
      redirect_to new_band_album_url
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album
      @album.destroy
      redirect_to band_url(@album.band_id)
    else
      flash[:errors] = ["You tried to delete a non-existing album!"]
      redirect_to band_url(@album.band_id)
    end

  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to band_url(@album.band_id)
    else
      redirect_to edit_album_url
    end
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :live)
  end

end
