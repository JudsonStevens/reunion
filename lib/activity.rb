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

  def split_cost
    total_cost = evaluate_cost
    fair_share = total_cost / @participants.keys.length
    cost_share_array = calculate_shares(fair_share)
  end

  def calculate_shares(fair_share)
    @participants.keys.map do |name|
      if @participants[name] < fair_share
        "#{name} owes #{fair_share - @participants[name]}."
      elsif @participants[name] > fair_share
        "#{name} owes #{fair_share - @participants[name]}."
      else
        "#{name} is neither owed money nor owes money."
      end
    end
  end


end
