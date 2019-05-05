require "set"

require "knapsacker/node"
require "knapsacker/version"

class Knapsacker
  def initialize(items, capacity:)
    @items = items.sort {|a, b| b.value.to_f / b.cost <=> a.value.to_f / a.cost } # TODO assert cost
    @capacity = capacity
    @candidates = SortedSet.new
  end

  def pack
    make_initial_node

    loop do
      node = select_node_to_grow
      if node
        grow(node, node.item_index + 1)
      else
        return node_with_highest_value.items
      end
    end
  end

  def grow(node, next_index)
    next_item = @items[next_index]

    if node.positive_child_growable?
      if next_item && node.cost + next_item.cost <= @capacity
        upper_bound = node.value + next_item.value + upper_bound_beyond(next_index, capacity: @capacity - node.cost - next_item.cost)
        node.positive_child = Node.new(next_index, next_item, upper_bound, node)
        @candidates << node.positive_child
      else
        node.cap_positive_child!
      end
    elsif node.negative_child_growable?
      if next_item
        upper_bound = node.value + upper_bound_beyond(next_index, capacity: @capacity - node.cost)
        node.negative_child = Node.new(next_index, nil, upper_bound, node)
        @candidates << node.negative_child
        @candidates.delete(node)
      else
        node.cap_negative_child!
      end
    end
  end

  def upper_bound_beyond(prev_index, capacity: capacity)
    index = prev_index + 1
    item = @items[index]

    return 0 unless item

    if item.cost > capacity
      item.value.to_f * capacity / item.cost
    else
      item.value + upper_bound_beyond(index, capacity: capacity - item.cost)
    end
  end

  private
    def make_initial_node
      @candidates << Node.new(-1, nil, upper_bound_beyond(-1, capacity: @capacity), nil)
    end

    def select_node_to_grow
      hopeful_node = @candidates.first

      unless hopeful_node.leaf?
        hopeful_node
      end
    end

    def node_with_highest_value
      @candidates.reduce do |provisional, candidate|
        provisional.value >= candidate.value ? provisional : candidate
      end
    end
end
