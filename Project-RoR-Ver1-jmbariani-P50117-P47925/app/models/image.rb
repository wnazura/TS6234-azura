class Image < ActiveRecord::Base
has_many :menus
has_many :outlets
has_many :exposures

validates_presence_of :extension
validates_format_of :extension,
:with => %r{.(jpg)$}i,
:message => "must be a URL for a JPG image"

					
DIRECTORY = 'public/images/'


after_save :process
after_destroy :cleanup

def file_data=(file_data)
@file_data = file_data
write_attribute 'extension' ,file_data.original_filename.split(' .' ).last.downcase
end

def path
File.join(DIRECTORY, "#{self.id}-#{extension}")
end

#######
private
#######

def process
if @file_data
create_directory
cleanup
save_image
@file_data = nil
end
end

def save_image
File.open(path, 'wb' ) do |file|
file.puts @file_data.read
end
end

def create_directory
FileUtils.mkdir_p DIRECTORY
end

def cleanup
Dir[File.join(DIRECTORY, "#{self.id}-*")].each do |filename|
File.unlink(filename) rescue nil
end
end


end
