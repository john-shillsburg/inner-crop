# this file contains various utility function for working with Pixel Objects
# and Image objects in the rmagick library
require 'pry'

class SatelliteImage
  # take an image and get the slope of the top line of the inner rectangle
  def initialize(img)
    @img = img
    @width
    @height
    @corner = Array.new

    @img.each_pixel do |pixel, col, row|
      if row == 0
        if pixel.red > 0 && pixel.green > 0 && pixel.blue > 0
          @width = @img.columns - col 
          @corner.push(col) 
          break
        end
      end
    end

    @img.each_pixel do |pixel, col, row|
      if col == @img.columns - 2
        if pixel.red > 0 && pixel.green > 0 && pixel.blue > 0
          @height = row
          @corner.push(row)
          break
        end
      end
    end
  end

  def get_slope
    if @width > @height
      return @width / @height
    else
      return @height / @width
    end
  end

  # retutn the x, y co
  def get_corner
    return @corner
  end
end

