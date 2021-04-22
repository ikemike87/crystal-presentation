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
  end

  def concurrency_example
    channel = Channel(Int32).new

    spawn do
      puts "before send"
      channel.send(1)
      puts "after send"
    end

    spawn do
      puts "before receive"
      puts channel.receive
      puts "after receive"
    end

    puts "before yield"
    Fiber.yield
    puts "after yield"
  end

  lib C 
    fun cos(value: Float64) : Float64
  end
end
include Presentation

# run functions
puts "\nStatic Typing Example\n"
static_type_example()
puts "\nConcurrency Example\n"
concurrency_example()
puts "\nC bindings Example\n"
puts C.cos(1.5)
