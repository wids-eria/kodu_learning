require 'digest/md5'

module ApplicationHelper
  def avatar_for(user, options = {})
    options.reverse_merge! :size => 24
    hash = Digest::MD5.hexdigest(user.gamer_tag || user.email)
    image_tag "http://www.gravatar.com/avatar/#{hash}?f=y&d=retro&s=#{options[:size]}"
  end
end
