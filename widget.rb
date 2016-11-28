require "ostruct"
require "pry"
require "facets/class/cattr"

load "grouped_methods.rb"

# ------------------------------------------------
# CLASS->WIDGET ----------------------------------
# ------------------------------------------------
class Widget

  include GroupedMethods

  # ----------------------------------------------
  # [MY-FIRST-GROUP] -----------------------------
  # ----------------------------------------------
  define_grouped_method :my_first_group, :foo do
    puts "Hello from my_first_group.foo"
  end 
  
  define_grouped_method :my_first_group, :bar do
    puts "Hello from my_first_group.bar"
  end 

  # ----------------------------------------------
  # [MY-SECOND-GROUP] ----------------------------
  # ----------------------------------------------
  define_grouped_method :my_second_group, :foo do
    puts "Hello from my_second_group.foo"
  end 
  
  define_grouped_method :my_second_group, :bar do
    puts "Hello from my_second_group.bar"
  end 
  
  define_grouped_method :my_second_group, :baz do
    puts "Hello from my_second_group.baz"
  end 

end

# ------------------------------------------------
# MAIN -------------------------------------------
# ------------------------------------------------
widget = Widget.new

widget.my_first_group.foo
widget.my_first_group.bar

puts "----------"

widget.my_second_group.foo
widget.my_second_group.bar
widget.my_second_group.baz
