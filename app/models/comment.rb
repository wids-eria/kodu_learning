class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :level

  validates :level,  presence: true
  validates :author, presence: true
end
