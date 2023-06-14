require 'benchmark'
require 'knapsacker'

class Item
  attr_reader :value, :cost
  def initialize(value, cost)
    @value = value
    @cost = cost
  end
end

class Runner
  attr_reader :result
  attr_accessor :capacity

  def initialize(input, capacity = 10)
    @input = input
    @capacity = capacity.to_i
  end

  def items
    @input.each_line.map do |line|
      Item.new(*line.split.map(&:to_i))
    end
  end

  def load
    @knapsacker = Knapsacker.new(@items, capacity: @capacity)
  end

  def load_items
    @items = items
  end

  def run
    @result = @knapsacker.pack
  end
end

r = Runner.new($stdin)
r.load_items
(500..599).each do |i|
  r.capacity = i
  r.load
  before = Time.now
  r.run
  time = Time.now - before
  puts "#{i}\t#{time}"
end

# r = Runner.new($stdin, ARGV[0])
# r.load
# Benchmark.bm do |x|
#   x.report { r.run }
# end
# puts "#{r.result.size} items: value #{r.result.sum(&:value)}, cost #{r.result.sum(&:cost)}" if ARGV[1] == '-v'
