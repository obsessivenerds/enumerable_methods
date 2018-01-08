module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i+=1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i+=1
    end
    self
  end

  def my_select
    self.my_each do |i|
      if param
        self[i].push if yield (i) == true
      else
        self.to_enum.push if self[i] == true
      end
    end
    self
  end

  def my_all?
    all = true
    self.my_each do |i|
      if param
        all = false if yield(i) == false
      else
        all = false if self(i) == false
      end
    end
    all
  end

  def my_any?
    all = true
    self.my_each do |i|
      if param
        all = true if yield(i) == true
      else
        all = true if self(i) == true
      end
    end
    all
  end

  def my_none?
    all = true
    self.my_each do |i|
      if param
        all = true if yield(i) == false
      else
        all = true if self[i] == false
      end
    end
    all
  end

  def my_count(*item)
    num = 0
    if item == true
      num = (self.length - item) + 1
    else
      if param
        num = self.length + 1
        yield(num)
      else
        num = self.length + 1
      end
    end
    num
  end

  def my_map
    arr = []
    self.my_each do |i|
      if param
        arr << yield(i)
      else
        arr << i.to_enum
      end
    end
    arr
  end

  def my_inject(item = self[0])
    item ||= []
    self.my_each do |i|
      item = yield(item, i)
    end
    item 
  end

end
