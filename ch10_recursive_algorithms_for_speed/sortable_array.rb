class SortableArray

  attr_reader :array

  def initialize(array)
    @array = array
  end

  def partition!(left_pointer, right_pointer)
    
    # 总是取最右的值作为轴
    pivot_position = right_pointer 
    pivot = @array[pivot_position]

    # 将右指针指向轴左边的一格
    right_pointer -= 1 

    while true do

      while @array[left_pointer] < pivot do
        left_pointer += 1
      end

      while @array[right_pointer] > pivot do
        right_pointer -= 1
      end

      if left_pointer >= right_pointer
        break
      else
        swap(left_pointer, right_pointer)
      end

    end

    # 最后将左指针的值与轴交换
    swap(left_pointer, pivot_position)

    # 根据快速排序的需要，返回左指针
    return left_pointer
  end

  def swap(pointer_1, pointer_2)
    temp_value = @array[pointer_1]
    @array[pointer_1] = @array[pointer_2]
    @array[pointer_2] = temp_value
  end

  def quicksort!(left_index, right_index)
    #base case: 分出的子数组长度为0或1
    if right_index - left_index <= 0
      return
    end
    
    # 将数组分成两部分，并返回分隔所用的轴的索引
    pivot_position = partition!(left_index, right_index)

    # 对轴左侧的部分递归调用quicksort
    quicksort!(left_index, pivot_position - 1)

    # 对轴右侧的部分递归调用quicksort
    quicksort!(pivot_position + 1, right_index)
  end

  def quickselect!(kth_lowest_value, left_index, right_index)

    if right_index - left_index <= 0
      return @array[left_index]
    end
    
    # 将数组分成两部分，并返回分隔所用的轴的索引
    pivot_position = partition!(left_index, right_index)

    if kth_lowest_value < pivot_position
      quickselect!(kth_lowest_value, left_index, pivot_position - 1)
    elsif kth_lowest_value > pivot_position
      quickselect!(kth_lowest_value, pivot_position + 1, right_index)
    else
      return @array[pivot_position]
    end
  end
  
end

array = [0, 5, 2, 1, 6, 3]
sortable_array = SortableArray.new(array)
sortable_array.quicksort!(0, array.length - 1)
p sortable_array.array

array = [0, 50, 20, 10, 60, 30]
sortable_array = SortableArray.new(array)
p sortable_array.quickselect!(1, 0, array.length - 1)