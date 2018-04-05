require './lib/activity'
class Reunion
  attr_reader :activities
  include Enumerable

  def initialize(location)
    @activities = []
    @location = location
  end

  def add_activity(activity)
    @activities << activity
  end

  def evaluate_total_cost
    total = @activities.map { |activity| activity.evaluate_cost  }.inject(:+)
  end

  def create_cost_breakdown

    new_array = @activities.map { |activity| activity.participants }
    names = new_array.map { |participants| participants.keys }.flatten.uniq
    x = names.map do |name|
      cost_array = new_array.map do |participants|
        participants[name] if participants.keys.include?(name)
      end
      [cost_array.inject(:+), name]
    end
end
