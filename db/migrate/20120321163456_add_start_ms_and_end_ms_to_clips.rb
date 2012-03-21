class AddStartMsAndEndMsToClips < ActiveRecord::Migration
  def change
    add_column :clips, :start_ms, :integer
    add_column :clips, :end_ms, :integer
    
    add_index :clips, :start_ms
    add_index :clips, :end_ms
  end
end
