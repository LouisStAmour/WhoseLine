class RecreateMovieIndexInClips < ActiveRecord::Migration
  def up
    remove_index :clips, :movie_id
    add_index :clips, :movie_id
  end

  def down
    remove_index :clips, :movie_id
    add_index :clips, :movie_id, :unique => true
  end
end
