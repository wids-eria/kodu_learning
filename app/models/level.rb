class Level < ActiveRecord::Base
  has_attached_file :level_file
  validates_presence_of :name
  validates_attachment_presence :level_file
end
