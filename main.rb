require 'processor'

puts "desired number of threads (default = 10):"
threads = STDIN.gets
if(threads == nil || threads.chomp.strip == '' || (threads.chomp.strip =~ /[\D]/)!=nil) 
	threads = '10'
	puts "the input doesn't seem to be a valid number of threads. Using the default value."
end

processor = Processor.new(:threads => threads.chomp.strip.to_i)

#feeding the stack
index = 0
while index!=100 do
	
	o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten;  
	string  =  (0..50).map{ o[rand(o.length)]  }.join;
	processor.stack.push string
	puts string+" is in the stack"
	index = index + 1

end

processor.start_processing
