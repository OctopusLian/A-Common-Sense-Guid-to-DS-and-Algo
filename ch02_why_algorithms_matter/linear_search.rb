def linear_search(array, value)
  # 遍历数组的每一个元组
  array.each do |element|

    # 如果这个元素等于我们要找的值，则将值返回
    if element == value
      return value

    # 如果这个值大于我们要找的值，则提早退出循环
    elsif element > value
      break
    end
  end

  # 如果没找到，则返回空值
  return nil
end