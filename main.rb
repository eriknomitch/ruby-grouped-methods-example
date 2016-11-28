load "widget.rb"

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
