class Photo < ActiveRecord::Base

  has_attached_file :file,
                    default_url: '/assets/default.jpg',
                    storage: :s3,
                    s3_credentials: "#{Rails.root}/config/s3.yml",
                    path: "photos/:style/:id/:filename"

  attr_accessible :name, :file

  validates :name, presence: true
  validates :file, presence: true

  validates_attachment_content_type :file, 
                    message: "is not in the correct format.", 
                    content_type: %w(image/jpeg image/png image/gif 
                      image/pjpeg image/x-png image/bmp image/jpg image/ico)
  validates_attachment_size :file, message: "is too large. (Max size: 5mb)", \
  :in => 0..5.megabyte

  def height_max
    width = self.width
    if width > 300
      percentage = 300.0/width.to_f
      height = self.height * percentage
    else
      height = self.height
    end
    height
  end

  def resize_image
    url = self.file.url
    dimensions = FastImage.size(url)
    width = dimensions[0].to_i
    height = dimensions[1].to_i
    if width > 1024 || height > 720
      name = self.name
      image = MiniMagick::Image.open(url)
      image.resize '1024x720'
      image.format 'jpg'
      image.write "#{Rails.root}/public/photos/#{name}.jpg"
      file = File.open("#{Rails.root}/public/photos/#{name}.jpg")
      self.file = file
      self.save
      file.close
      File.delete("#{Rails.root}/public/photos/#{name}.jpg")
    end
  end

  def save_dimensions
    dim = FastImage.size(self.file.url)
    self.width = dim[0]
    self.height = dim[1]
    self.save
  end
end