class Level < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  has_attached_file :level_file

  validates_presence_of :name
  validates_presence_of :user
  validates_attachment_presence :level_file
  validates_attachment_content_type :level_file, content_type: 'application/octet-stream',
    message: "Wrong kind of file. (content type)"
end
