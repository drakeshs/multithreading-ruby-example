class SimpleStack
  def initialize
    @stack = Array.new()
    @is_free = true
  end
  def push x
    @stack << x
  end
  def pop
    if(@stack.length != 0)
    	value = @stack[@stack.length-1]
	@stack.delete_at(@stack.length-1)
    	return value
    end
    return nil
  end
  def size
  	@stack.size
  end
  
end
