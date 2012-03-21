class Playlist < ActiveRecord::Base
  has_many :playlist_clips, :order => :position, :dependent => :destroy
  has_many :clips, :through => :playlist_clips, :order => :position
  belongs_to :user
end
