# Functions to go over basic Crystal
module Presentation
  VERSION = "0.1.0"

  # printing
  def printing_example
    puts "Hello World!"
  end

  # variables
  def variable_example
    message = "Hello World!"
    puts message
    p! message
  end

  # math
  def math_example(num1, num2 : Int, num3 = 2)
    add = num1 + num2
    minus = num1 - num2
    multi = num1 * num2
    exponent = num1 ** num3
    div = num1 / num3
    fdiv = num1 // num3
    mod = num1 % num3

    # num1 = 9, num2 = 5, num3 = 2
    p! add,
      minus,
      multi,
      exponent,
      div,
      fdiv,
      mod
  end

  # strings
  def string_example
    puts "\"Hello World\"\n"

    puts %("Hello World"\n)

    str = "Hello World"
    puts "str = #{str}\n"
    puts "str length = #{str.size}"
  end

  # if
  def if_example
    if true
      puts "True"
    end

    if 1 == 1
      puts "1 = 1"
    end

    if 1 == 2
      puts "1 = 2"
    else
      puts "1 = 1"
    end

    if 1 == 2
      puts "1 = 2"
    elsif 1 == 1
      puts "1 = 1"
    else
      puts "1 = 3"
    end
  end

  # data structures
  def data_structure_example
    puts [1, 2, 3],
      [1, "hello", 'x']

    arr = [1, 2, 3]
    p! arr
    arr << 4
    p! arr

    arr2 = [1, 2, 3] of Int32 | String
    arr2 << "str"
    p! arr2
  end

  # loops
  def loop_example
    count = 0
    while count < 3
      puts "#{count}\n"
      count += 1
    end
    puts "\n"

    arr = [1, 2, 3]
    arr.each {|i| 
      puts i + 1
    }

  end
end

include Presentation

# run functions
puts "Printing Example\n"
printing_example
puts "\nVariable Example\n"
variable_example()
puts "\nMath Example\n"
math_example(9, 5)
puts "\n"
math_example 9, 5
puts "\nString Example\n"
string_example()
puts "\nIf Example\n"
if_example()
puts "\nData Structure Example\n"
data_structure_example()
puts "\nLoop Example\n"
loop_example()