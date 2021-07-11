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
      if pixel.red > 1000 && pixel.green > 1000 && pixel.blue > 1000
        @width = @img.columns - col 
        @corner.push(row) 
        break
      end
    end

    @img.each_pixel do |pixel, col, row|
      if col == @img.columns - 2
        if pixel.red > 1000 && pixel.green > 1000 && pixel.blue > 1000
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

  def unrotate
    pixels = @img.get_pixels(0, 0, @img.columns, @img.rows)
    # go over slope then down 1.  repeat until @width
    unrotated = Array.new
    puts @corner
    
  end
end

