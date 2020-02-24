# RandomOrder
With this gem, you can return a random record from the database using SQL or use `random scope` to return records in random order.

## Usage
Works with `MySQL`, `SQLite`, `PostgreSQL`.

This gem is adding three methods to ActiveRecord Relations - `random` and `fast_random(n = 1)`.

You can do the following:
```ruby
u1 = User.create(name: 'Lilith')
u2 = User.create(name: 'Metamorph')
u3 = User.create(name: 'Diablo')

assert_equal User.random.is_a?(ActiveRecord::Relation), true
assert_equal User.fast_random.is_a?(ActiveRecord::Relation), true
```
## Fast Random method
As you may know `order by RANDOM()` might be slow in case you have many records in DB. I think the case I suggest to use another method which is bundled with this gem fast_random which is using another SQL to return random records from DB. It has some limitations like your table must have a primary key column.
Simple benchmark on the table with `113000 records` shows that it's faster. See screenshot with logs below:

```ruby
n = 1000

Benchmark.bm do |benchmark|
  benchmark.report("random.limit(10)") do
    n.times do |nn|
      Events.random.limit(10).to_a
    end
  end

  benchmark.report("fast_random(10)") do
    n.times do |nn|
      Events.fast_random(10).to_a
    end
  end
end
                    user     system      total        real
random.limit(10)  2.612499   0.193492   2.805991 (1162.501909)
fast_random(10)   2.234706   0.140195   2.374901 ( 37.173482)

# Find one random record
Benchmark.bm do |benchmark|
  benchmark.report("random.first.id") do
    n.times do |nn|
      Events.random.first.id
    end
  end

  benchmark.report("fast_random.first.id") do
    n.times do |nn|
      Events.fast_random.first.id
    end
  end
end
#
                        user     system      total        real
random.first.id       2.014658   0.134942   2.149600 (1151.981899)
fast_random.first.id  1.661777   0.067484   1.729261 ( 35.350424)
#
```

#### Examples:
```ruby
User.friends.random # return ActiveRecord::Relation with user`s random friends
User.random.first.friends.random # return ActiveRecord::Relation with random user`s random friends
Post.published.random.limit(3) # return ActiveRecord::Relation with 3 published posts
Post.published.fast_random(3) # --//-- and faster
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'random_order'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install random_order
```

# TODO
- `oracle` adapter
- `sqlserver` adapter
- `MongoDB` with `Mongoid`

## Contributing
Contribution directions go here.

### Source
`https://rubygems.org/gems/random_order`

## License
The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
