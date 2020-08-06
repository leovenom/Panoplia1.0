ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  'app173398417@heroku.com',
  :password             =>  'svuxovxw3025',
  :domain               =>  'panoplia.heroku.com',
  :enable_starttls_auto  =>  true
}