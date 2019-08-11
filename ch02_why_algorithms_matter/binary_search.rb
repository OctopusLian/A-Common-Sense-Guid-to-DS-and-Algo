def binary_search(array, value)

  # 首先，设定下界和上界，以限定所查的值可能出现的范围
  # 在开始时，以数组的第一个元素为下界，以最后一个元素为上界
  lower_bound = 0
  upper_bound = array.length - 1

  # 循环检查上界和下界之间的最中间的元素

  while lower_bound <= upper_bound do

    # 找出中间的索引

    midpoint = (upper_bound + lower_bound) / 2

    # 获取该索引的值

    value_at_midpoint = array[midpoint]

    # 如果该值是我们想要的，返回即可
    # 否则，调整上界或下界

    if value < value_at_midpoint
      upper_bound = midpoint - 1
    elsif value > value_at_midpoint
      lower_bound = midpoint + 1
    elsif value == value_at_midpoint
      return midpoint
    end
  end

  # 当下界超越上界，得知数组里没有我们想要的值，返回nil

  return nil
end