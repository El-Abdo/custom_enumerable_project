module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    if block_given?
      for el in self
        yield el
      end
    end

    self
  end
end
