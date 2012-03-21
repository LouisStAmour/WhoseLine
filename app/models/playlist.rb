class Playlist < ActiveRecord::Base
  has_many :playlist_clips, :order => :position
  has_many :clips, :through => :playlist_clip
  belongs_to :user
end
