class AlbumsController < ApplicationController
 def new
  @album = Album.new
 end

 def create
  @album = Album.new(album_params)
  @album.save!
  byebug
  redirect_to @album
 end

 def show
  @album = Album.find(params[:id])
 end

 private

 def album_params
   params.require(:album).permit(:title, :tag, photos:[])
 end
end
