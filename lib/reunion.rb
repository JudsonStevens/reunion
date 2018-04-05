require './lib/activity'
class Reunion
  attr_reader :activities,
              :total_cost,
              :names

  def initialize(location)
    @activities = []
    @location = location
    @total_cost = 0
  end

  def add_activity(activity)
    @activities << activity
  end

  def evaluate_total_cost
    @total_cost = @activities.map { |activity| activity.evaluate_cost }.inject(:+)
  end

  def create_cost_breakdown
    participant_list = @activities.map { |activity| activity.participants }
    names = participant_list.map { |participants| participants.keys }.flatten.uniq
    cost_breakdown = names.map do |name|
      cost_array = participant_list.map do |participants|
        participants[name] if participants.keys.include?(name)
      end
      [name, ((evaluate_total_cost / names.length) - cost_array.compact.inject(:+))]
    end.to_h
  end
end
