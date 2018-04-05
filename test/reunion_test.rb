require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def setup
    @r = Reunion.new("Aspen")
  end

  def test_it_exists
    assert_instance_of Reunion, @r
  end

  def test_it_can_add_activities
    activity = Activity.new("climbing")
    @r.add_activity(activity)
    expected = "climbing"
    actual = @r.activities[0].activity_name

    assert_equal expected, actual
  end

  def test_it_can_evaluate_total_reunion_cost
    climbing = Activity.new("climbing")
    climbing.add_participant("Sally", 15)
    climbing.add_participant("Bob", 20)
    hiking = Activity.new("hiking")
    hiking.add_participant("Sally", 15)
    hiking.add_participant("Bob", 20)
    @r.add_activity(climbing)
    @r.add_activity(hiking)

    expected = 70
    actual = @r.evaluate_total_cost

    assert_equal expected, actual
  end

  def test_it_can_create_cost_breakdown
    climbing = Activity.new("climbing")
    climbing.add_participant("Sally", 15)
    climbing.add_participant("Bob", 20)
    hiking = Activity.new("hiking")
    hiking.add_participant("Sally", 18)
    hiking.add_participant("Bob", 23)
    @r.add_activity(climbing)
    @r.add_activity(hiking)

    expected = {"Sally" => 5, "Bob" => -5}
    actual = @r.create_cost_breakdown

    assert_equal expected, actual
  end




end
