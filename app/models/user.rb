class User < ActiveRecord::Base
  has_many :playlists
end
