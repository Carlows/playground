require 'file_uploader'

class FileUploadController < ApplicationController
	def show
	end

  def new
  end

  def create
  	file = params[:file]
  	filename = FileUploader.upload_file(file)

  	redirect_to '/'
  end

end
