require 'file_manager'

class FileUploadController < ApplicationController
	def show
		@image_paths = FileManager.get_imagepaths("public/files/")
	end

  def new
  end

  def create
  	file = params[:file]
  	filename = FileManager.upload_file(file)

  	redirect_to show_uploads_url
  end

end
