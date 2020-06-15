class AddAvatarToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :avatar, :string
  end
end
