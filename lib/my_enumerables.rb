module Enumerable
  # a clone of the each_with_index array method
  def my_each_with_index
    return unless block_given?

    i = 0
    self.my_each do |el|
      yield el, i
      i += 1
    end
    self
  end
end

class Array
  # my_each a clone of the enumerable array method (each)
  def my_each
    if block_given?
      for el in self
        yield el
      end
    end

    self
  end
end
