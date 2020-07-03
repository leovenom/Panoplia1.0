class AddUrlToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :url, :text
  end
end
