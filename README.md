# RandomOrder
With this gem, you can return a random record from the database using SQL or use `random scope` to return records in random order.

## Usage
Works with `MySQL`, `SQLite`, `PostgreSQL`.

This gem is adding three methods to ActiveRecord Relations - `random` , `find_random` and `find_many_random(...)`, `fast_random(n = 1)`.

You can do the following:
```ruby
u1 = User.create(name: 'Lilith')
u2 = User.create(name: 'Metamorph')
u3 = User.create(name: 'Diablo')

assert_equal User.random.is_a?(ActiveRecord::Relation), true
assert_equal User.find_many_random(10).is_a?(ActiveRecord::Relation), true
assert_equal User.fast_random.is_a?(ActiveRecord::Relation), true
assert_equal User.find_random.is_a?(User), true
```
## Fast Random method
As you may know `order by RANDOM()` might be slow in case you have many records in DB. I think the case I suggest to use another method which is bundled with this gem fast_random which is using another SQL to return random records from DB. It has some limitations like your table must have a primary key column.
Simple benchmark on the table with `88000 records` shows that it's `20` times faster. See screenshot with logs below:

```ruby
n = 10
Benchmark.bm do |benchmark|
  benchmark.report("find_many_random(100)") do
    n.times do
      Business.find_many_random(100).to_a
    end
  end
  benchmark.report("fast_random(100)") do
    n.times do
      Business.fast_random(100).to_a
    end
  end
end
#
                         user     system      total        real
find_many_random(100)  0.088990   0.025837   0.114827 ( 13.836576)
fast_random(100)       0.060209   0.013933   0.074142 (  0.699557)
```

#### Examples:
```ruby
User.friends.random # return ActiveRecord::Relation with user`s random friends
User.find_random.friends.random # return ActiveRecord::Relation with random user`s random friends
Post.published.random.limit(3) # return ActiveRecord::Relation with 3 published posts
Post.published.find_many_random(3) # --//--
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
