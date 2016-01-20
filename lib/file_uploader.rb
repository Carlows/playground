require 'securerandom'

class FileUploader
	def upload_file(file)
		directory = "public/files"
		extension = File.extname(file.original_filename)
		name = SecureRandom.hex + extension
		path = File.join(directory, name)

		File.open(path, "wb") do |f|
			f.write(file.read)
		end

		name
	end
end
