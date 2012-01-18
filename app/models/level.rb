class Level < ActiveRecord::Base
  has_attached_file :level_file
  validates_presence_of :name
  validates_attachment_presence :level_file

  validates_attachment_content_type :level_file, content_type: 'application/octet-stream',
    message: "Wrong kind of file. (content type)"
end
