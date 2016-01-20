require 'securerandom'

class FileUploader
	def upload_file(file)
		directory = "public/files"
		name = create_random_hash
		path = File.join(directory, name)

		File.open(path, "wb") do |file|
			file.write(file.read)
		end

		name
	end

	private
		def create_random_hash
			SecureRandom.hex
		end
end