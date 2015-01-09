class PhotosController < ApplicationController
  before_filter :authenticate

  def index
    @title = 'Photos'
    @photos = Photo.order('created_at DESC')
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    flash[:notice] = 'Photo deleted'
    redirect_to photos_path
  end

  def upload
    @title = 'Upload'
  end

  def upload_photo
    upload_name = params[:upload][:name]
    upload_file = params[:upload][:file]
    upload_check_resize(upload_name, upload_file)
  end
end