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
  # a clone of the boolean Array#all? returns true if all elements are true against some block (or array is empty)
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
  # a clone of the boolean Array#any? returns true when any element is true to the block (or non empty array)
  def my_any?
    return true unless block_given?

    result = false
    self.my_each do |el|
      if yield el
        result = true
      end
    end
    result
  end
  # a clone of the boolean Array#none? returns true when no elements are true to the block (or empty array)
  def my_none?
    return true if self.empty?

    result = true
    self.my_each do |el|
      if yield el
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
