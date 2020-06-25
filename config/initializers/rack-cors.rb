if defined? Rack::Cors
  Rails.configuration.middleware.insert_before 0, Rack::Cors do
    allow do
      origins %w[
        https://panoplia.art/
        http://panoplia.art/
        https://www.panoplia.art/
        http://www.panoplia.art/
        https://panoplia.herokuapp.com/
        http://panoplia.herokuapp.com/
      ]
      resource '/assets/*'
    end
  end
end