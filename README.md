# RandomOrder
This gem could DRY your code and return random relation objects or instance object.

## Usage
Works with `MySQL`, `SQLite`, `PostgreSQL`

This gem is adding three methods to ActiveRecord Relations - `random` , `find_random` and `find_many_random(...)`.

You can do the following:
```ruby
u1 = User.create(name: 'Lilith')
u2 = User.create(name: 'Metamorph')
u3 = User.create(name: 'Diablo')

assert_equal User.find_random.is_a?(User), true
assert_equal User.random.is_a?(ActiveRecord::Relation), true
assert_equal User.find_many_random(10).is_a?(ActiveRecord::Relation), true
```
#### Examples:
```ruby
User.friends.random # return ActiveRecord::Relation with user`s random friends
User.find_random.friends.random # return ActiveRecord::Relation with random user`s random friends
Post.published.random.limit(3) # return ActiveRecord::Relation with 3 published posts
Post.published.find_many_random(3) # --//--
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

## Contributing
Contribution directions go here.

## License
The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
