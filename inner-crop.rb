require 'rubygems'
require 'rmagick'
img = Magick::Image::read("test/satellite.jpg")[0]

img.scale(0.2).write("test/scaled.jpg") do |f|
  f.quality = 0.6
end

