# Functions to go over basic Crystal
module Presentation
  VERSION = "0.1.0"

  # data structures
  def static_type_example
    arr = [1, 2, 3]
    p! arr
    arr << 4
    p! arr

    arr2 = [1, 2, 3] of Int32 | String
    arr2 << "str"
    p! arr2
    puts arr2[2]
  end
end
include Presentation

# run functions
puts "\nStatic Typing Example\n"
static_type_example()
