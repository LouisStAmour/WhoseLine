class RecreateIndexesOnPlaylistClips < ActiveRecord::Migration
  def up
    remove_index :playlist_clips, :clip_id
    remove_index :playlist_clips, :playlist_id
    add_index :playlist_clips, :clip_id
    add_index :playlist_clips, :playlist_id
  end

  def down
    remove_index :playlist_clips, :clip_id
    remove_index :playlist_clips, :playlist_id
    add_index :playlist_clips, :clip_id, :unique => true
    add_index :playlist_clips, :playlist_id, :unique => true
  end
end
