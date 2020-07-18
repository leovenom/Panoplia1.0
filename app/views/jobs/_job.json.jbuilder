json.extract! job, :id, :title, :description, :url, :job_type, :location, :job_author, :remote_ok, :apply_url, :art_type, :created_at, :updated_at, :avatar, :search
json.url job_url(job, format: :json)
