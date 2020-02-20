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

    assert_equal User.find_random.size, 1
    assert_equal User.find_many_random(2).size, 2
  end
end
