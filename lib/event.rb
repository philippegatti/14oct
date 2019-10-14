
require 'time'
require_relative 'event_creator'


class Event
  attr_accessor :start_date
  attr_accessor :duration
  attr_accessor :title
  attr_accessor :attendees
  @@calendar = []
 
def initialize(start_date, minutes, title, attendees)
  @start_date = Time.parse(start_date)
  @duration = minutes	
  @title = title
  @attendees = attendees
  @@calendar << self
  return self.to_s
end

def postpone_24h
	@start_date += 86400
end

def end_date
	return end_date = @start_date + duration*60
end

def is_past?
	return @start_date < Time.now
end

def is_future?
	return @start_date > Time.now
end

def is_soon?
	return @start_date > Time.now && @start_date < Time.now + 30*60
end

def to_s
	return
	puts "> Titre : #{@title}" 
	puts "> Date de début : #{@start_date.strftime("%Y-%m-%d %H:%M:%S")}" 
	puts "> Durée : #{@duration} minutes"
	puts "> Invités : #{@attendees.join(', ')}"
end

def self.calendar_output
	return @@calendar
end

end #fin de ma classe
