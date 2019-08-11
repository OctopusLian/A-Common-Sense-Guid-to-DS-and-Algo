function selectionSort(array) {
  for(var i = 0; i < array.length; i++) {  //外层，每一轮的检查
    var smallestNumberIndex = i;  //先记住目前的最小值的索引
    for(var j = i + 1; j < array.length; j++) {  //内层，逐个检查数组未排序的格子
      if(array[j] < array[smallestNumberIndex]) {  
        smallestNumberIndex = j;  //若遇到比之前记录的本轮最小值还小的格子值，更新smallestNumberIndex
      }
    }
 
    if(smallestNumberIndex != i) {
      var temp = array[i];
      array[i] = array[smallestNumberIndex];
      array[smallestNumberIndex] = temp;
    }
  }
  return array;
}