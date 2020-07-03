class AddVideoIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :video_id, :integer
  end
end
