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
      if pixel.red > 4000 && pixel.green > 4000 && pixel.blue > 4000
        @width = @img.columns - col 
        @corner.push(row) 
        break
      end
    end

    @img.each_pixel do |pixel, col, row|
      if col == @img.columns - 2
        if pixel.red > 1000 && pixel.green > 1000 && pixel.blue > 1000
          @height = @img.rows - row
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
    pixels.each do |pixel|
      if(pixel.red > 1000 && pixel.green > 1000 && pixel.blue > 1000)
        unrotated.push(pixel)
      end
    end
    puts pixels.length
    puts unrotated.length
    puts "height: #{@height} width: #{@width}"
    img = Magick::Image.constitute(@width, @height, "RGB", unrotated)
    img.write("unrotated.jpg")
  end
end

