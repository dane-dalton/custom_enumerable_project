module Enumerable
  # Your code goes here
  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    for element in self do 
      block.call(element)
    end
  end

  def my_each_with_index(&block)
    i = 0
    for element in self do
      block.call(element, i)
      i += 1
    end
  end

  def my_select(&block)
    arr = []
    for element in self do
      arr << element if block.call(element)
    end
    arr
  end

  def my_all?(&block)
    for element in self do
      return false unless block.call(element)
    end
    return true
  end

  def my_any?(&block)
    for element in self do 
      return true if block.call(element)
    end
    return false
  end

  def my_none?(&block)
    for element in self do
      return false if block.call(element)
    end
    return true
  end

  def my_count(&block)
    count = 0
    for element in self do 
      count += 1 unless block_given?
      if block_given?
        count += 1 if block.call(element)
      end
    end
    return count
  end

  def my_map(&block)
    arr = []
    for element in self do
      arr << block.call(element)
    end
    arr
  end

  def my_inject(initial = 0, &block)
    final = initial
    for element in self do
      final = block.call(final, element)
    end
    final
  end
end
