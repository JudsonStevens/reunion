class Activity
  attr_reader :activity_name,
              :participants

  def initialize(activity_name)
    @participants = Hash.new
    @activity_name = activity_name
  end

  def add_participant(participant_name, paid)

    @participants[participant_name] = paid
  end

  def evaluate_cost
    @participants.values.inject(:+)
  end

end
