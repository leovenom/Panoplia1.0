class Job < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  JOB_TYPES = ["Full-time", "Part-time", "Contract", "Freelance"]
  ART_TYPES = ["Illustrator", "Photographer", "Concept Artist", "Sculptor", "Graphic Designer", "Video Artist"]

end
