# this file contains various utility function for working with Pixel Objects
# and Image objects in the rmagick library
require 'pry'

class SatelliteImage
  # take an image and get the slope of the top line of the inner rectangle
  def initialize(img)
    @img = img
    @width
    @height
    @top_left = Array.new
    @top_right = Array.new
    @bottom_left = Array.new
    @bottom_right = Array.new

    @img.each_pixel do |pixel, col, row|
      if pixel.red > 4000 && pixel.green > 4000 && pixel.blue > 4000
        @top_left.push(col)
        @top_left.push(row)
        break
      end
    end
    puts @top_left
  end
end

