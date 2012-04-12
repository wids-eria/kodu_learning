class Assignment < ActiveRecord::Base
  belongs_to :user
  has_many :levels

  validates_presence_of :title
end
