require 'securerandom'

class FileManager
	def self.upload_file(file)
		directory = "public/files"
		extension = File.extname(file.original_filename)
		name = SecureRandom.hex + extension
		path = File.join(directory, name)

		File.open(path, "wb") do |f|
			f.write(file.read)
		end

		name
	end

	def self.get_imagepaths(folder_path)
		file_paths = Dir.glob("#{folder_path}/*")
		image_paths = select_images(get_filenames(file_paths))
	end

	private
		def self.get_filenames(file_paths)
			file_paths.map { |path| File.basename(path) }
		end

		def self.select_images(file_paths)
			file_paths.select do | path |
				File.extname(path) == '.jpg' || File.extname(path) == '.png' || File.extname(path) == '.gif'
			end
		end
end
