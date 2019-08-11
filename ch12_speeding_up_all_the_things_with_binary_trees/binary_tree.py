class TreeNode:
    def __init__(self,val,left=None,right=None):
        self.value = val
        self.leftChild = left
        self.rightChild = right

def search(value, node):
    # Base case: 如果node不存在，或者node的值符合
    if node is None or node.value == value:
        return node

    # 如果value小于当前节点，那就从左子节点处查找
    elif value < node.value:
        return search(value, node.leftChild)

    # 如果value大于当前节点，那就从右子节点处查找
    else:  # value > node.value
        return search(value, node.rightChild)

def insert(value, node):
    if value < node.value:

        # 如果左子节点不存在，则将新值作为左子节点
        if node.leftChild is None:
            node.leftChild = TreeNode(value)
        else:
            insert(value, node.leftChild)

    elif value > node.value:

        # 如果右子节点不存在，则将新值作为右子节点
        if node.rightChild is None:
            node.rightChild = TreeNode(value)
        else:
            insert(value, node.rightChild)


def traverse_and_print(node):
    if node is None:
        return
    traverse_and_print(node.leftChild)
    print(node.value)
    traverse_and_print(node.rightChild)

def delete(valueToDelete, node):

    # 当前位置的上一层无子节点，已到达树的底层
    if node is None:
        return None

    # 如果要删除的值小于（或大于）当前节点
    # 则以左子树（或右子树）为参数，递归调用本方法，然后将当前节点的左链（或右链）指向返回的节点
    elif valueToDelete < node.value:
        node.leftChild = delete(valueToDelete, node.leftChild)
        # 将当前节点（及其子树，如果存在的话），返回作为其父节点的新左子节点（或新右子节点）
        return node
    elif valueToDelete > node.value:
        node.rightChild = delete(valueToDelete, node.rightChild)
        return node

    # 如果要删除的正是当前节点
    elif valueToDelete == node.value:

        # 如果当前节点没有左子节点
        # 则以右子节点，（及其子树，如果存在的话）替换当前节点成为当前节点之父节点的新子节点
        if node.leftChild is None:
            return node.rightChild

            # 如果当前节点没有左子节点，也没有右子节点，那这里就是返回None

        elif node.rightChild is None:
            return node.leftChild
    
        # 如果当前节点有两个子节点，则用lift函数来做删除，它会使当前节点的值变成其后继节点的值
        else:
            node.rightChild = lift(node.rightChild, node)
            return node

    
def lift(node, nodeToDelete):

    # 如果此函数的当前节点有左子节点，则递归调用本函数，从左子树找出后继节点
    if node.leftChild:
        node.leftChild = lift(node.leftChild, nodeToDelete)
        return node
    # 如果此函数的当前节点无左子节点，则代表当前节点是后继节点，于是将其值设置为被删除节点的新值
    else:
        nodeToDelete.value = node.value
        # 用后继节点的右子节点替代后继节点的父节点的左子节点
        return node.rightChild

        

root = TreeNode(50)
insert(25, root)
insert(75, root)
insert(11, root)
insert(33, root)
insert(30, root)
insert(40, root)
insert(56, root)
insert(52, root)
insert(61, root)
insert(89, root)
insert(82, root)
insert(95, root)
insert(55, root)
delete(50, root)
traverse_and_print(root)