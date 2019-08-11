class PrintManager

  def initialize
    @queue = []
  end

  def queue_print_job(document)
    @queue.push(document)
  end

  def run
    while @queue.any?
      # shift方法：可以移出并返回数组的第一个元素
      print(@queue.shift)
    end
  end

  private 

  def print(document)
    # 打印文档
    puts document
  end

end

print_manager = PrintManager.new
print_manager.queue_print_job("First Document")
print_manager.queue_print_job("Second Document")
print_manager.queue_print_job("Third Document")
print_manager.run