class Playlist < ActiveRecord::Base
  has_many :clips, :through => :playlist_clip
  belongs_to :user
end
