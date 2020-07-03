json.extract! video, :id, :title, :description, :user_id, :user_video, :url, :created_at, :updated_at
json.url video_url(video, format: :json)
