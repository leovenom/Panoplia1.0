module VideosHelper

  require 'net/http'

  # Regex to find YouTube's and Vimeo's video ID
  YOUTUBE_REGEX = %r(^(http[s]*:\/\/)?(www.)?(youtube.com|youtu.be)\/(watch\?v=){0,1}([a-zA-Z0-9_-]{11}))
  VIMEO_REGEX = %r(^https?:\/\/(?:.*?)\.?(vimeo)\.com\/(\d+).*$)

  # Finds YouTube's video ID from given URL or [nil] if URL is invalid
  # The video ID matches the RegEx \[a-zA-Z0-9_-]{11}\
  def find_youtube_id url 
    url = sanitize url
    matches = YOUTUBE_REGEX.match url.to_str
    if matches
      matches[6] || matches[5]
    end
  end

  # Get YouTube video iframe from given URL
  def get_youtube_iframe url, width, height
    youtube_id = find_youtube_id url

    result = %(<iframe title="YouTube video player" width="#{width}"
                height="#{height}" src="//www.youtube.com/embed/#{ youtube_id }"
                frameborder="0" allowfullscreen></iframe>)
    result.html_safe
  end

  # Finds Vimeo's video ID from given URL or [nil] if URL is invalid
  def find_vimeo_id url
    url = sanitize url
    matches = VIMEO_REGEX.match url.to_str
    matches[2] if matches
  end

  # Get Vimeo video iframe from given URL
  def get_vimeo_iframe url, width, height
    vimeo_id = find_vimeo_id url
    uri = "https://vimeo.com/api/oembed.json?url=https%3A//vimeo.com/#{ vimeo_id }&width=#{ width }&height=#{ height }"
    # see -> https://stackoverflow.com/a/4581095/1498118
    response = Net::HTTP.get( URI.parse( uri ))
    json = JSON.parse response
    json['html'].html_safe
  end

  # Main function
  # Return a video iframe
  # If the url provided is not a valid YouTube or Vimeo url it returns [nil]
  def get_video_iframe(url, width = "328px", height = "300px")
    if find_vimeo_id(url)
      get_vimeo_iframe(url, width, height) 
    elsif find_youtube_id(url)
      get_youtube_iframe(url, width, height) 
    end
  end

end
