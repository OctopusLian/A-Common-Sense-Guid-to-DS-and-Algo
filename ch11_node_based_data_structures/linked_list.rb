#---
# Excerpted from "A Common-Sense Guide to Data Structures and Algorithms",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/jwdsal for more book information.
#---
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
    # We begin at the first node of the list:
    current_node = first_node
    current_index = 0

    while current_index < index do
      # We keep following the links of each node until we get to the
      # index we're looking for: 
      current_node = current_node.next_node
      current_index += 1

      # If we're past the end of the list, that means the
      # value cannot be found in the list, so return nil:
      return nil unless current_node
    end

    return current_node.data
  end

  def index_of(value)
    # We begin at the first node of the list:
    current_node = first_node
    current_index = 0

    begin
      # If we find the data we're looking for, we return it:
      if current_node.data == value
        return current_index
      end

      # Otherwise, we move on the next node:
      current_node = current_node.next_node
      current_index += 1
    end while current_node

    # If we get through the entire list, without finding the
    # data, we return nil:
    return nil
  end

  def insert_at_index(index, value)
    current_node = first_node
    current_index = 0

    # First, we find the index immediately before where the
    # new node will go:
    while current_index < index do
      current_node = current_node.next_node
      current_index += 1
    end

    # We create the new node:
    new_node = Node.new(value)
    new_node.next_node = current_node.next_node
    
    # We modify the link of the previous node to point to
    # our new node:
    current_node.next_node = new_node
  end

  def delete_at_index(index)
    current_node = first_node
    current_index = 0

    # First, we find the node immediately before the one we
    # want to delete and call it current_node:
    while current_index < index - 1 do
      current_node = current_node.next_node
      current_index += 1
    end

    # We find the node that comes after the one we're deleting: 
    node_after_deleted_node = current_node.next_node.next_node

    # We change the link of the current_node to point to the
    # node_after_deleted_node, leaving the node we want
    # to delete out of the list:
    current_node.next_node = node_after_deleted_node
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
