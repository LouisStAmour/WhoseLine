class PlaylistClip < ActiveRecord::Base
  belongs_to :clip
  belongs_to :playlist
  acts_as_list
end
