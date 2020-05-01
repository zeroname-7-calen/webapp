class FileuploadsController < ApplicationController

  def index
    @img_paths = []
    jpgs = Dir.glob(Rails.root.join('public', '*.jpg'))
    jpgs.each do |png|
      @img_paths.push('/'+File.basename(png))
  end

end

  def create
    uploaded_file = fileupload_param[:file]
    output_path = Rails.root.join('public', "kitten.jpg")
    # output_path = Rails.root.join('public', uploaded_file.kitten.jpg)
    File.open(output_path, 'w+b') do |fp|
      fp.write uploaded_file.read
    end
    redirect_to root_path
  end

  def new
  end

  private
    def fileupload_param
      params.require(:fileupload).permit(:file)
    end
end
