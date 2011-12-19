require 'simplestack'

# This class not only controls the thread pool but contains the method that will be run by the threads.
class Processor

  attr_accessor :threads, :stack

  # constructor
  def initialize args
    self.threads = args[:threads]
    self.stack = SimpleStack.new
  end

  # this is the method that'll be called externally in order to process the data
  def start_processing
    threads_index = 1
    threads_array = Array.new

    while (threads_index <= self.threads)
      # the method and its parameters are being passed in the Thread's constructor 
      threads_array << Thread.new{process_something threads_index}
      threads_index = threads_index + 1
    end

    threads_array.each do |thread|
      thread.join
    end
  end

  # this method is the one which will be called by the threads
  private
    def process_something thread_id
      puts thread_id.to_s+ " started"

      # I'm using the sleep method here to make the example easier to understand :)
      sleep 1

      while(true) do
        value = @stack.pop
        if value == nil
          puts thread_id.to_s+ " ended"
          return
        else
          puts thread_id.to_s+" -> "+value

	  # I'm using the sleep method here to make the example easier to understand as well :)
          sleep 1
        end
     end
  end
end
