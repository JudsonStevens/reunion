Dir["./lib/*.rb"].each { |file| require file }
require 'erb'

climbing = Activity.new("climbing")
hiking = Activity.new("hiking")
rowing = Activity.new("rowing")

climbing.add_participant("Archer", 35)
climbing.add_participant("Mallory", 44)
climbing.add_participant("Lana", 88)
hiking.add_participant("Archer", 22)
hiking.add_participant("Lana", 12)
hiking.add_participant("Krieger", 100)
rowing.add_participant("Lana", 5)

reunion = Reunion.new("Aspen")

reunion.add_activity(climbing)
reunion.add_activity(hiking)
reunion.add_activity(rowing)

x = reunion.create_cost_breakdown
puts x

simple_template = "The cost breakdown for the reunion is <%= reunion.create_cost_breakdown %>."

renderer = ERB.new(simple_template)
puts output = renderer.result()
