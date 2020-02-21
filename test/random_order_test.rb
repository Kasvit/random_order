require './test_helper'

class RandomOrder::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, RandomOrder
  end

  test "works" do
    u1 = User.create(name: 'John')
    u2 = User.create(name: 'Bob')
    u3 = User.create(name: 'Lilit')
    u4 = User.create(name: 'Sue')
    u5 = User.create(name: 'Max')

    assert_equal User.random.is_a?(ActiveRecord::Relation), true
    assert_equal User.find_many_random(10).is_a?(ActiveRecord::Relation), true
    assert_equal User.fast_random.is_a?(ActiveRecord::Relation), true
    assert_equal User.find_random.is_a?(User), true
    assert_equal User.find_many_random(2).count, 2
    assert_equal User.random.count, 5
    assert_equal User.find_random.class, User
    assert_equal User.fast_random(2).count, 2
  end
end
