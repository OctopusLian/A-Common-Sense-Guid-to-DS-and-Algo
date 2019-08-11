class Node

  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
  end

end

class LinkedList

  attr_accessor :first_node

  def initialize(first_node)
    @first_node = first_node
  end

  def read(index)
    # 从第一个结点开始
    current_node = first_node
    current_index = 0

    while current_index < index do
      # 顺着链往下找，直到我们要找的那个索引值
      current_node = current_node.next_node
      current_index += 1

      # 如果读到最后一个结点之后，就说明所找的索引不在链表中，因此返回nil
      return nil unless current_node
    end

    return current_node.data
  end

  def index_of(value)
    # 从第一个结点开始
    current_node = first_node
    current_index = 0

    begin
      # 如果找到，就返回
      if current_node.data == value
        return current_index
      end

      # 否则，看下一个结点
      current_node = current_node.next_node
      current_index += 1
    end while current_node

    # 如果遍历整个链表都没有找到，就返回nil
    return nil
  end

  def insert_at_index(index, value)
    current_node = first_node
    current_index = 0

    # 首先，找出新结点插入位置前的那一结点
    while current_index < index do
      current_node = current_node.next_node
      current_index += 1
    end

    # 创建新结点
    new_node = Node.new(value)
    new_node.next_node = current_node.next_node
    
    # 使前一结点的链指向新结点
    current_node.next_node = new_node
  end

  def delete_at_index(index)
    # 如果删除的是第一个节点，则将first_node重置为第二个节点，并返回原来第一个节点
    if index == 0
      deleted_node = first_node
      @first_node = first_node.next_node
      return deleted_node
    end

    current_node = first_node
    current_index = 0

    # 先找出被删结点前的那一结点，并将其命名为current_node
    while current_index < index - 1 do
      current_node = current_node.next_node
      current_index += 1
    end

    # 再找出被删节点后的那一节点
    deleted_node = current_node.next_node
    node_after_deleted_node = current_node.next_node.next_node

    # 将current_node的链指向node_after_deleted_node，这样被删节点就被排除在链表之外了
    current_node.next_node = node_after_deleted_node
    deleted_node
  end

end

node_1 = Node.new("once")
node_2 = Node.new("upon")
node_1.next_node = node_2

node_3 = Node.new("a")
node_2.next_node = node_3

node_4 = Node.new("time")
node_3.next_node = node_4

list = LinkedList.new(node_1)

list.read(3)

list.index_of("time")
