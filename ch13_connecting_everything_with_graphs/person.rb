class Person
  
  attr_accessor :name, :friends, :visited

  def initialize(name)
    @name = name
    @friends = []
  end

  def add_friend(friend)
    @friends << friend
  end

  def display_network
    # 记下每个访问过的人，以便算法完结后能重置他们的visited的属性为false
    to_reset = [self]

    # 创建一个开始就含有根节点的队列
    queue = [self]
    self.visited = true

    while queue.any?
      # 设置出队的顶点为当前顶点
      current_vertex = queue.shift
      puts current_vertex.name

      # 将当前顶点的所有未访问的邻接点加入队列
      current_vertex.friends.each do |friend|
        if !friend.visited
          to_reset << friend
          queue << friend
          friend.visited = true
        end
      end
    end

    # 算法完结时，将访问过的节点的visited属性重置为false
    to_reset.each do |node|
      node.visited = false
    end
  end

end

alice = Person.new("Alice")
bob = Person.new("Bob")
candy = Person.new("Candy")
derek = Person.new("Derek")
elaine = Person.new("Elaine")
fred = Person.new("Fred")
gina = Person.new("Gina")
helen = Person.new("Helen")
irena = Person.new("Irena")

alice.add_friend(bob)
alice.add_friend(candy)
alice.add_friend(derek)
alice.add_friend(elaine)
bob.add_friend(fred)
fred.add_friend(helen)
derek.add_friend(gina)
gina.add_friend(irena)

bob.add_friend(alice)
candy.add_friend(alice)
derek.add_friend(alice)
elaine.add_friend(alice)

fred.add_friend(bob)
helen.add_friend(fred)
gina.add_friend(derek)
irena.add_friend(gina)

alice.display_network
