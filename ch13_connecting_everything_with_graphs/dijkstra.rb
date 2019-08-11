class City
  
  attr_accessor :name, :routes

  def initialize(name)
    @name = name
    # 把表示邻接点的数组换成散列表
    @routes = {}
  end

  def add_route(city, price_info)
    @routes[city] = price_info
  end
  
end

atlanta = City.new("Atlanta")
boston = City.new("Boston")
chicago = City.new("Chicago")
denver = City.new("Denver")
el_paso = City.new("El Paso")

atlanta.add_route(boston, 100)
atlanta.add_route(denver, 160)
boston.add_route(chicago, 120)
boston.add_route(denver, 180)
chicago.add_route(el_paso, 80)
denver.add_route(chicago, 40)
denver.add_route(el_paso, 140)

def dijkstra(starting_city, other_cities)
  # 散列表routes_from_city用来保存从给定城市到其他所有城市的价格以及中途经过的城市
  routes_from_city = {}

  # 从起点城市到起点城市是免费的
  routes_from_city[starting_city] = [0, starting_city]
  
  # 初始化该散列表时，因为去往所有其他城市的花费都未知，所以先设为无限
  other_cities.each do |city|
    routes_from_city[city] = [Float::INFINITY, nil]
  end
  
  # 已访问的城市记录在这个数组里
  visited_cities = []

  # 一开始先访问起点城市，将current_city设为它
  current_city = starting_city

  # 进入算法的核心逻辑，循环访问每一座城市
  while current_city

    # 正式访问当前城市
    visited_cities << current_city

    # 检查从当前城市出发的每一条航线
    current_city.routes.each do |city, price_info|
      # 如果起点城市到其他城市的价格比routes_from_city所记录的更低，则更新记录
      if routes_from_city[city][0] > price_info + routes_from_city[current_city][0]
        routes_from_city[city] = [price_info + routes_from_city[current_city][0], current_city]
      end
    end

    # 决定下一个要访问的城市
    current_city = nil
    cheapest_route_from_current_city = Float::INFINITY
    # 检查所有已记录的路线
    routes_from_city.each do |city, price_info|
    # 在未访问的城市中找出最便宜的那个，设为下一个要访问的城市
      if price_info[0] < cheapest_route_from_current_city && !visited_cities.include?(city)
        cheapest_route_from_current_city = price_info[0]
        current_city = city
      end
    end
    
  end

  return routes_from_city
end

routes = dijkstra(atlanta, [boston, chicago, denver, el_paso])
routes.each do |city, price_info|
  p "#{city.name}: #{price_info[0]}"
end