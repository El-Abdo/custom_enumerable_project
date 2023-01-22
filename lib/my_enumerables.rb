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
  # my_select a clone of the array method Array#select
  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    self.my_each do |el|
      if yield el
        result << el
      end
    end
    result
  end
  # a clone of Array#all? that checks the array elements against some block
  def my_all?
    return to_enum(:my_all?) unless block_given?
    return true if self.empty?

    result = true
    self.my_each do |el|
      unless yield el
        result = false
      end
    end
    result
  end
end

class Array
  # my_each a clone of the enumerable array method Array#each
  def my_each
    if block_given?
      for el in self
        yield el
      end
    end

    self
  end
end
