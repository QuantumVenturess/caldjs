module PhotosHelper

  def photo_types
    %w(jpeg png gif pjpeg x-png bmp jpg ico)
  end

  def upload_check_resize(upload_name, upload_file)
    if upload_file.nil?
      flash[:error] = 'File cannot be blank'
      redirect_to upload_path
    else
      name = upload_file.original_filename
      directory = 'public/photos'
      path = File.join(directory, name)
      File.open(path, 'wb') { |f| f.write(upload_file.read) }
      file = File.open(path)
      dim = FastImage.size(file)
      ext = File.extname(file).split('.')[-1]
      size = File.size(path).to_f/2**20
      file.close
      if !photo_types.include?(ext) || size > 5
        File.delete(path)
        if !photo_types.include?(ext)
          flash[:error] = 'Invalid photo type'
        elsif size > 5
          flash[:error] = 'Photo cannot be larger than 5 MB'
        end
        redirect_to upload_path
      else
        if dim[0] > 1024 || dim[1] > 720
          image = MiniMagick::Image.open(path)
          image.resize '1024x720'
          image.format ext
          image.write path
        end
        resized_file = File.open(path)
        dim = FastImage.size(resized_file)
        photo = Photo.new
        photo.name = !upload_name.blank? ? upload_name \
          : name.split(".#{ext}")[0]
        photo.file = resized_file
        photo.width = dim[0]
        photo.height = dim[1]
        photo.save!
        resized_file.close
        File.delete(path)
        redirect_to photos_path
      end
    end
  end
end