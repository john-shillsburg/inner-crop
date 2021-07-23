# this file contains various utility function for working with Pixel Objects
# and Image objects in the rmagick library
require 'pry'

class SatelliteImage
  # take an image and get the slope of the top line of the inner rectangle
  def initialize(img)
    @img = img
    @top_left = Array.new
    @top_right = Array.new
    @angle

    @img.each_pixel do |pixel, col, row|
      if pixel.red > 4000 && pixel.green > 4000 && pixel.blue > 4000
        @top_left.push(col)
        @top_left.push(row)
        break
      end
    end

    @img.each_pixel do |pixel, col, row|
      if col == @img.columns - 2
        if pixel.red > 4000 && pixel.green > 4000 && pixel.blue > 4000
          @top_right.push(col)
          @top_right.push(row)
          break
        end
      end
    end
    @angle = Math.atan(Float(@top_right[1]) / (Float(@img.columns) - Float(@top_left[0])))
    @angle = @angle * 180 / Math::PI
  end

  def rotate()
    rotated = @img.rotate(-@angle)
    rotated.write("rotated.jpg")
    # top_left.x = the amount to trim from side
    # top_right.y = the amount to trim from top and bottom
    chopped = rotated.crop(@top_left[0], @top_right[1], @img.columns, @img.rows)
    #chopped = rotated.crop(0, 0, @top_right[0], @img.rows)
    chopped.write("chopped.jpg")
  end

  def top_left
    return @top_left
  end

  def top_right
    return @top_right
  end
end

