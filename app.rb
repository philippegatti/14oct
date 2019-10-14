require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/event_creator'
require_relative 'lib/calendar_displayer'
require "pry"


ev1 = Event.new("2019-10-02 12:00", 180, "dej", "Robert")
ev2 = Event.new("2019-10-02 16:00", 180, "Réunion", "Jon")
ev3 = Event.new("2019-10-07 16:00", 180, "Réunion de merde", "Bill")
ev4 = Event.new("2019-10-12 12:00", 180, "RDV medecin", "Robert")
ev5 = Event.new("2019-10-18 16:00", 180, "Match Rugby", "Jon")
ev6 = Event.new("2019-10-19 16:00", 180, "Réunion de merde", "Bill")
ev7 = Event.new("2019-10-21 12:00", 180, "dej", "Robert")
ev8 = Event.new("2019-10-21 16:00", 180, "Réunion", "Jon")
ev9 = Event.new("2019-10-21 16:00", 180, "Projet à rendre", "Bill")
ev9 = Event.new("2019-10-31 16:00", 180, "Anniversaire", "Bill")

initial_calendar = Calendar.display

binding.pry
puts "end of file"