# this file contains various utility function for working with Pixel Objects
# and Image objects in the rmagick library

# take an image and get the slope of the top line of the inner rectangle
def get_slope(img)
  img.each_pixel do |pixel, col, row|
    puts "Pixel at: #{col}x#{row}:
  \tR: #{pixel.red}, G: #{pixel.green}, B: #{pixel.blue}"
  end
end
