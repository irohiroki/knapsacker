class Knapsacker
  class Node
    attr_accessor :negative_child
    attr_accessor :positive_child
    attr_reader :item_index
    attr_reader :upper_bound

    def initialize(item_index, item, upper_bound, parent)
      @item_index  = item_index
      @item        = item
      @upper_bound = upper_bound
      @parent      = parent
    end

    def <=>(other)
      if other.upper_bound == upper_bound
        other.item_index <=> item_index
      else
        other.upper_bound <=> upper_bound
      end
    end

    def cap_negative_child!
      @negative_child = :cap
    end

    def cap_positive_child!
      @positive_child = :cap
    end

    def cost
      if @parent
        @parent.cost + (@item ? @item.cost : 0)
      else
        0
      end
    end

    def items
      if @parent
        if @item
          @parent.items << @item
        else
          @parent.items
        end
      else
        []
      end
    end

    def leaf?
      @negative_child == :cap && @positive_child == :cap
    end

    def negative_child_growable?
      @negative_child.nil?
    end

    def positive_child_growable?
      @positive_child.nil?
    end

    def value
      if @parent
        @parent.value + (@item ? @item.value : 0)
      else
        0
      end
    end
  end
end
