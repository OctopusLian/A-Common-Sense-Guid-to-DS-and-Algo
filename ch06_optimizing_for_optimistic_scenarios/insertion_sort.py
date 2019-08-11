def insertion_sort(array):
  # 从索引1开始循环遍历数组
   for index in range(1, len(array)):

     # 保存当前索引
     position = index
     temp_value = array[index]

     while position > 0 and array[position - 1] > temp_value:
         array[position] = array[position - 1]
         position = position - 1

     # 将temp_value放回到数组的空隙中
     array[position] = temp_value