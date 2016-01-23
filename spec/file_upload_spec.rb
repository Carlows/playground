require 'spec_helper'
require 'file_manager'
require 'rack/test'

describe '#FileManager' do
	include Rack::Test::Methods

	before :each do
		path = "spec/fixtures/files"
		@test_path = "spec/fixtures/testfiles"
		@file = Rack::Test::UploadedFile.new("#{path}/test.txt", "text/plain")
		@gifimage = Rack::Test::UploadedFile.new("#{path}/test2.gif", "image/gif")
		@jpgimage = Rack::Test::UploadedFile.new("#{path}/test3.jpg", "image/jpeg")
	end

	describe '.upload_file' do

		it 'stores in the specified folder' do
			key = FileManager.upload_file(@file, @test_path)

			path = "#{@test_path}/#{key}"
			expect(File.exist?(path)).to be true
		end

		it 'generates random name' do
			filename1 = FileManager.upload_file(@file, @test_path)
			filename2 = FileManager.upload_file(@file, @test_path)

			expect(filename1 == filename2).to be false
		end
	end

	describe '.get_imagepaths' do
		before :each do
			@filename1 = FileManager.upload_file(@file, @test_path)
			@filename2 = FileManager.upload_file(@gifimage, @test_path)
			@filename3 = FileManager.upload_file(@jpgimage, @test_path)
		end

		it 'returns an array of filenames' do
			result = FileManager.get_imagepaths(@test_path)
			expect(result).to be_instance_of(Array)
			expect(result).not_to be_empty
		end

		it 'returns only images' do
			result = FileManager.get_imagepaths(@test_path)
			expect(result.count).to eq(2)
			expect(result).to include(@filename2, @filename3) 
		end
	end
end