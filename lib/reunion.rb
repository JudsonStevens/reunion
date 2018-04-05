require './lib/activity'
class Reunion
  attr_reader :activities
  def initialize(location)
    @activities = []
    @location = location
  end

  def add_activity(activity)
    @activities << activity
  end

end
