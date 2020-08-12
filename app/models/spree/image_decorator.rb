module Spree
	module ImageDecorator
			mount_uploader :attachment, CloudinaryUploader, :mount_on => :attachment_file_name
			def save_attached_files; end
			def prepare_for_destroy; end
			def destroy_attached_files; end

			def attachment_file_name
			# handle NilClass gracefully
			attachment.file.nil? ? "" : attachment.file.filename
			end
end
end
::Spree::Image.prepend(MyStore::Spree::ImageDecorator)