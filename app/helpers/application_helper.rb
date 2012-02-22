require 'digest/md5'

module ApplicationHelper
  def avatar_for(user)
    hash = Digest::MD5.hexdigest(user.gamer_tag || user.email)
    image_tag "http://www.gravatar.com/avatar/#{hash}?f=y&d=retro&s=24"
  end
end
