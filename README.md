# Knapsacker

Knapsacker is a [Knapsack problem](https://en.wikipedia.org/wiki/Knapsack_problem) solver in Ruby, using branch and bound algorithm.

It has a simple API and may solve problems in your holiday programming. (That is, it's not optimized. Yet.)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'knapsacker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knapsacker

## Usage

First, instanciate Knapsacker with an array of your items. The items must respond to `value` and `cost`. And a keyword argument `capacity` is mandatory. e.g.:

```ruby
Item = Struct.new(:value, :cost)
knapsacker = Knapsacker.new([Item.new(3, 4), Item.new(4, 5)], capacity: 5)
```

Then call `pack`:

```ruby
items_to_take = knapsacker.pack
```

It will return items you should take.

### Similar projects

There are some knapsack problem solver in Ruby but none has API. (Some of them accepts items as command line arguments or data in file.)

* [danielsellergren/ruby-knapsack](https://github.com/danielsellergren/ruby-knapsack) ... Accepts command line arguments
* [sucanjan/knapsack-solver](https://github.com/sucanjan/knapsack-solver) ... Accepts data files, Gnuplot-able
* [soulcutter/no_change_please](https://github.com/soulcutter/no_change_please) ... Accepts a data file
* [mertbulan/knapsack-problem](https://github.com/mertbulan/knapsack-problem) ... No API
* [pedroperrone/knapsack-problem](https://github.com/pedroperrone/knapsack-problem) ... No API
* [shouheiyamauchi/KnapsackProblemSolver](https://github.com/shouheiyamauchi/KnapsackProblemSolver) ... No API
* [Adacchi3/KnapsackProblem](https://github.com/Adacchi3/KnapsackProblem) ... No API
* [sas145alex/knapsack_greedy](https://github.com/sas145alex/knapsack_greedy) ... No API
* [bsmlima/connected-knapsack](https://github.com/bsmlima/connected-knapsack) ... No README
* [mhartman4/fanduel-scrape](https://github.com/mhartman4/fanduel-scrape) ... No README

### Roadmap

* 1.0
  * Interface to support the general form of Knapsack problem, including:
    * Multiple inequality constraints
    * Multiple equality constraints
  * Spport for items that have interface other than `value` and `cost`
* 1.1
  * Some optimization, maybe. Either in C, either with some smarter algorithm.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/irohiroki/knapsacker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Knapsacker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/irohiroki/knapsacker/blob/master/CODE_OF_CONDUCT.md).
