require_relative 'event'

class EventCreator

	def self.define_title
		puts "Salut, tu veux créer un événement ? Cool !"
		puts "Commençons. Quel est le nom de l'événement ?"
		print "> "
		return title = gets.chomp
	end

	def self.define_start_date
		puts "Super. Quand aura-t-il lieu ?"
		print "> "
		return start_date = gets.chomp
	end

	def self.define_duration
		puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
		print "> "
		return duration = gets.chomp
	end

	def self.define_attendees
		puts "Génial. Qui va participer ? Balance leurs e-mails?"
		print "> "
		attendees = gets.chomp
		puts "Super, c'est noté, ton évènement a été créé !"
		return attendees = attendees.split(/[,\s]+/)
	end

	def self.create
		title = define_title()
		start_date = define_start_date()
		duration = define_duration
		attendees = define_attendees
		return Event.new(start_date, duration, title, attendees)
	end
end

