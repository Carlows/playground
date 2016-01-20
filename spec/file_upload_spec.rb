require 'spec_helper'
require 'file_uploader'
require 'rack/test'

describe '.upload_file' do
	include Rack::Test::Methods

	before :each do
		@file = Rack::Test::UploadedFile.new("spec/fixtures/files/test.txt", "text/plain")
		@file_manager = FileUploader.new
	end

	it 'stores the file' do
		key = @file_manager.upload_file(@file)
		path = "public/files/#{key}"
		expect(File.exist?(path)).to eq(true)
	end

	it 'generates random name' do
		filename1 = @file_manager.upload_file(@file)
		filename2 = @file_manager.upload_file(@file)

		expect(filename1 == filename2).to eq(false)
	end
end