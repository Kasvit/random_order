# RandomOrder
With this gem, you can return a random record from the database using SQL or use `random` scope to return records in random order.

## Usage
Works with `MySQL`, `SQLite`, `PostgreSQL`.

This gem is adding methods to ActiveRecord Relations - `random` and `fast_random(n = 1)`.

```ruby
# If you have a few records in DB
@posts = Post.published.random.limit(30)
@admin = User.admins.random.first
# or same but using different method which returns data faster from DB if you have many records
@posts = Post.fast_random(30)
@admin = User.admins.fast_random(1).first
# Method "random"
#`random` is a scope which you can all on your ActiveRerords models and relations.
# Method "fast_random"
#`fast_random` is an another implementation to return random records from DB. It works much faster but has own limitations like it works in tables with primary key only.
#You can see some benchmarks below:

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

                        user     system      total        real
random.first.id       2.014658   0.134942   2.149600 (1151.981899)
fast_random.first.id  1.661777   0.067484   1.729261 ( 35.350424)
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

## License
The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
