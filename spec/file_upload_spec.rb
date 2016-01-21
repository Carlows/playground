require 'spec_helper'
require 'file_manager'
require 'rack/test'

describe '.upload_file' do
	include Rack::Test::Methods

	before :each do
		@file = Rack::Test::UploadedFile.new("spec/fixtures/files/test.txt", "text/plain")
	end

	it 'stores the file' do
		key = FileManager.upload_file(@file)
		path = "public/files/#{key}"
		expect(File.exist?(path)).to eq(true)
	end

	it 'generates random name' do
		filename1 = FileManager.upload_file(@file)
		filename2 = FileManager.upload_file(@file)

		expect(filename1 == filename2).to eq(false)
	end
end
