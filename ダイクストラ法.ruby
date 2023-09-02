N, M = gets.chomp.split.map(&:to_i)
graph = Array.new(N){[]}
inf = 10**10
leafs_not_confirm = Array.new(N, inf)
leafs_confirm = Array.new(N, false)

M.times do |i|
    u,v,w = gets.chomp.split.map(&:to_i)
    graph[u] << [v, w]
end

leafs_not_confirm[0] = 0

while true do
    break if leafs_not_confirm.min == inf

    # 未確定の頂点の内最小のものを確定
    min = leafs_not_confirm.min
    min_ind = leafs_not_confirm.index(min)
    leafs_not_confirm[min_ind] = inf
    leafs_confirm[min_ind] = min

    # 確定した頂点からつながる頂点の内未確定のものに値を入れる
    
    graph[min_ind].each do |next_node|
        next if leafs_confirm[next_node[0]]
        leafs_not_confirm[next_node[0]] = [min + next_node[1], leafs_not_confirm[next_node[0]]].min
    end
end

leafs_confirm.each do |ans|
    p ans
end

