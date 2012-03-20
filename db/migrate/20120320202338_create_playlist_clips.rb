class CreatePlaylistClips < ActiveRecord::Migration
  def change
    create_table :playlist_clips do |t|
      t.integer :position
      t.integer :clip_id
      t.integer :playlist_id

      t.timestamps
    end
    add_index :playlist_clips, :clip_id, :unique => true
    add_index :playlist_clips, :playlist_id, :unique => true
  end
end
