require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @a = Activity.new("climbing")
  end

  def test_it_exists
    assert_instance_of Activity, @a
  end

  def test_it_has_a_name
    expected = "climbing"
    actual = @a.activity_name

    assert_equal expected, actual
  end

  def test_it_can_add_participants
    @a.add_participant("Sally", 15)
    expected = {"Sally" => 15}
    actual = @a.participants

    assert_equal expected, actual
  end

  def test_it_can_evaluate_cost
    @a.add_participant("Sally", 15)
    @a.add_participant("Bob", 20)
    expected = 35
    actual = @a.evaluate_cost

    assert_equal expected, actual
    
  end

end
