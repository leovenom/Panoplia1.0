class Job < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  JOB_TYPES = ["Full-time", "Part-time", "Contract", "Freelance"]
  ART_TYPES = ["Other","Illustration", "Graphic Design", "Drawing", "Photography", "Video" , "Motion" , "Sculpture", "Graffiti", "Dance", "Music", "Serigraphy", "Theater", "Painting", "Collage", "Embroidery"]

end

