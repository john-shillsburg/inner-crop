# this file contains various utility function for working with Pixel Objects
# and Image objects in the rmagick library
require 'pry'
# take an image and get the slope of the top line of the inner rectangle
def get_slope(img)
  $width
  $height
  img.each_pixel do |pixel, col, row|
    if row == 0
      if pixel.red > 0 && pixel.green > 0 && pixel.blue > 0
        $width = img.columns - row
        break
        puts "Pixel at: #{col}x#{row}:
      \tR: #{pixel.red}, G: #{pixel.green}, B: #{pixel.blue}"       
      end
    end
  end

  img.each_pixel do |pixel, col, row|
    if col == img.columns - 2
      if pixel.red > 0 && pixel.green > 0 && pixel.blue > 0
        $height = row
        break
      end
    end
  end

  puts "height: #{$height} width: #{$width}"

end

