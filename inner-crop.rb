require 'rubygems'
require 'rmagick'
require_relative 'src/satellite_image.rb'

img = Magick::Image::read("test/satellite.jpg")[0]

img.scale(0.1).write("test/scaled.jpg") do |f|
  f.quality = 0.6
end

img = Magick::Image::read("test/scaled.jpg")[0]

sat = SatelliteImage.new(img)

