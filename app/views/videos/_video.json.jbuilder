json.extract! video, :id, :title, :description, :user_id, :user_video, :created_at, :updated_at
json.url video_url(video, format: :json)
