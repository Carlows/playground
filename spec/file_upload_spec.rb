require 'spec_helper'
require 'file_uploader'

describe '.upload_file' do
	it 'stores the file' do
		file_manager = FileUploader.new

		key = file_manager.upload_file("test file content")
		expect(File.exist?("/public/files/#{key}")).to eq(true)
	end
end