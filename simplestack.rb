# A simple implementation of a stack.
class SimpleStack
  def initialize
    @stack = Array.new()

    # the 'is_free' variable is responsible to manage the synchronicity
    # @is_free = true
  end

  # default push method
  def push x
    @stack << x
  end

  # default pop method
  def pop
    if(@stack.length != 0)
    	value = @stack[@stack.length-1]
	@stack.delete_at(@stack.length-1)
    	return value
    end
    return nil
  end

  # returns the size of the stack
  def size
  	@stack.size
  end
  
end
