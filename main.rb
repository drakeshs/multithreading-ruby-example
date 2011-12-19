# This script contains the user interface. Also, it sets up the processor in order to run the example.
require 'processor'

# starts the thread pool
puts "desired number of threads (default = 10):"
threads = STDIN.gets

# just some number validation. If it's not a number, then the default value will be used
if(threads == nil || threads.chomp.strip == '' || (threads.chomp.strip =~ /[\D]/)!=nil)
  threads = '10'
  puts "the input doesn't seem to be a valid number of threads. Using the default value."
end

processor = Processor.new(:threads => threads.chomp.strip.to_i)

# feeds the stack by creating randomly generated 50 character values
index = 0
while index!=100 do
  o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten;
  string  =  (0..50).map{ o[rand(o.length)]  }.join;
  processor.stack.push string
  puts string+" is in the stack"
  index = index + 1
end

# starts processing
processor.start_processing
