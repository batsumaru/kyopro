class Node
  attr_accessor :parent, :size
  def initialize(n)
    @parent = n
    @size = 1
  end
end

class UnionFindTree
  def initialize(n)
    @nodes = (0..n).map { |i| Node.new(i) }
  end

  def find(x)
    return x if @nodes[x].parent == x
    @nodes[x].parent = find(@nodes[x].parent)
  end

  def unite(a, b)
    pa = find(a)
    pb = find(b)
    return if pa == pb

    if @nodes[pa].size < @nodes[pb].size
      @nodes[pa].parent = pb
      @nodes[pb].size += @nodes[pa].size
    else
      @nodes[pb].parent = pa
      @nodes[pa].size += @nodes[pb].size
    end
  end

  def same?(a, b)
    find(a) == find(b)
  end

  def size(x)
    @nodes[find(x)].size
  end

  def num_of_connected_component
    res = 0
    1.upto(@nodes.length-1) do |i|
      res += 1 if find(i) == i
    end
    res
  end
end
