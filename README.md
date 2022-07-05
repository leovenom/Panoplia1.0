# Panóplia

<a href="https://leonardt.eu">
 <p align="center">
  <img src="https://i.imgur.com/c16ilx6.png?w="350" alt="Profile"
 </p>
</a>

# With Ruby on Rails

This README would normally document whatever steps are necessary to get the
application up and running.

* Deployment instructions

#### Make sure Ruby is installed on your system. Fire command prompt and run command:

```
# Make sure Rails is installed
ruby -v

# If you see Ruby and Rails version then you are good to start, other wise Setup Ruby On Rails on Ubuntu
rails -v
```
#### Once done, Now

```
# Clone respected git repository
git clone https://github.com/leovenom/Panoplia1.0.git

# Install all dependencies
bundle install

# Create db and migrate schema
rake db:create
rake db:migrate

# Now run your application
rails s
```
#### The Gem List

- [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) + [Mini Magick](https://github.com/minimagick/minimagick) - For image uploads and optimization
- [Devise](https://github.com/plataformatec/devise) - User authentication and roles
- [Guard](https://github.com/guard/guard) - Doing work to files as they change - A task runner of sorts
- [Guard Livereload](https://github.com/guard/guard-livereload) - Reloads the browser when files change combined with the Live Reload extension on your favorite browser.
- [Better Errors](https://github.com/charliesome/better_errors) - Displays better errors during development. 
- [Simple Form](https://github.com/plataformatec/simple_form) - Simpler forms in Rails
- [Bulma Rails](https://github.com/joshuajansen/bulma-rails) - My favorite CSS framework as of late based on Flexbox.
- [Impressionist](https://github.com/charlotte-ruby/impressionist) - We use this to get view counts on shots
- [Gravatar Image Tag](https://github.com/mdeering/gravatar_image_tag) - Easy way to grab a user's gravatar image based on their account email
- [Acts As Votable](https://github.com/ryanto/acts_as_votable) - Like and unlike shots
