class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :filename
      t.string :subtitle
      t.integer :movie_id

      t.timestamps
    end
    add_index :clips, :movie_id, :unique => true
  end
end
