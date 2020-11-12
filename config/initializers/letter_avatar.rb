LetterAvatar.setup do |config|
  config.fill_color        = 'rgba(255, 255, 255, 1)' # default is 'rgba(255, 255, 255, 0.65)'
  config.cache_base_path   = 'public/system/lets'     # default is 'public/system'
  # config.colors_palette    = :iwanthue                # default is :google
  config.colors_palette = :custom
  config.custom_palette = [[150, 0, 200], [255, 220, 0], [70, 208, 110], [255, 120, 190], [234, 76, 137]]
  # config.weight            = 500                      # default is 300
  # config.annotate_position = '-0+10'                  # default is -0+5
  # config.letters_count     = 2                        # default is 1
  # config.pointsize         = 70                       # default is 140
  # config.font = File.join(File.expand_path('../../', File.dirname(__FILE__)), 'app/assets/fonts', 'font_name.ext')
end