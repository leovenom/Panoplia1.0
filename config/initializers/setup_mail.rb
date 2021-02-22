# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#   :address              =>  'smtp.sendgrid.net',
#   :port                 =>  '587',
#   :authentication       =>  :plain,
#   :user_name            =>  'app173398417@heroku.com',
#   :password             =>  'svuxovxw3025',
#   :domain               =>  'panoplia.heroku.com',
#   :enable_starttls_auto  =>  true
# }
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  "apikey",
  :password             =>  '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',
  :api_key             =>  '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',
  :domain               =>  'panoplia.heroku.com',
  :enable_starttls_auto  =>  true
}