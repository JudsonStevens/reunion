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

end
