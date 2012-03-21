class Clip < ActiveRecord::Base
  has_many :playlist_clips, :order => :position, :dependent => :destroy
  has_many :playlists, :through => :playlist_clips
  belongs_to :movie
end
