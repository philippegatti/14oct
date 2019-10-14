
require_relative 'event'

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


def events_days(calendar)
  busy_days=[]  
  for i in 0..calendar.size-1
    busy_days << calendar[i].start_date.strftime("%d").to_i
  end
  return busy_days
end


def line_1
  puts "-"*70
end

def line_2 (monday,sunday)
  for i in monday..sunday
    if i < 1
      print "|"+" "*9
    elsif i < 10
      print "|"+i.to_s+" "*8
    else
      print "|"+i.to_s+" "*7
    end
  end
  puts "|"
end

def line_3 (monday, sunday, calendar, busy_days)
  for i in monday..sunday
    unless busy_days.include?(i)
      print "|"+" "*9
    else
      if calendar.count {|event| event.start_date.strftime("%d").to_i == i} > 1
        print "|#{calendar.count {|event| event.start_date.strftime("%d").to_i == i}} events "
      else
        print "|#{calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].start_date.strftime("%H:%M")}    "
      end
    end
  end
  puts "|"
end

def line_4 (monday, sunday, calendar, busy_days)
  for i in monday..sunday
    unless busy_days.include?(i)
      print "|"+" "*9
    else
      if calendar.count {|event| event.start_date.strftime("%d").to_i == i} > 1
        print "|scheduled"
      else
        if calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ').size > 0
          print "|#{calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ')[0][0..8]}"+" "*(9 - [calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ')[0].size.to_i,9].min)
        else
          print "|"+" "*9
        end
      end
    end
  end
  puts "|"
end

def line_5 (monday, sunday, calendar, busy_days)
  for i in monday..sunday
    unless busy_days.include?(i)
      print "|"+" "*9
    else
      if calendar.count {|event| event.start_date.strftime("%d").to_i == i} > 1
        print "|"+" "*9
      else
        if calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ').size > 1
          print "|#{calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ')[1][0..8]}"+" "*(9 - [calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ')[1].size.to_i,9].min)
        else
          print "|"+" "*9
        end
      end
    end
  end
  puts "|"
end

def line_6 (monday, sunday, calendar, busy_days)
  for i in monday..sunday
    unless busy_days.include?(i)
      print "|"+" "*9
    else
      if calendar.count {|event| event.start_date.strftime("%d").to_i == i} > 1
        print "|"+" "*9
      else
        if calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ').size > 2
          print "|#{calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ')[2][0..8]}"+" "*(9 - [calendar[calendar.index{|event| event.start_date.strftime("%d").to_i == i}].title.split(' ')[2].size.to_i,9].min)
        else
          print "|"+" "*9
        end
      end
    end
  end
  puts "|"
end

def line_7
  puts "-"*70
end

def week(monday,sunday,calendar,busy_days)
  line_2(monday,sunday)
  line_3(monday,sunday,calendar,busy_days)
  line_4(monday,sunday,calendar,busy_days)
  line_5(monday,sunday,calendar,busy_days)
  line_6(monday,sunday,calendar,busy_days)
  line_7
end

def month(calendar,busy_days)
  line_1
  week(0,6,calendar,busy_days)
  week(7,13,calendar,busy_days)
  week(14,20,calendar,busy_days)
  week(21,27,calendar,busy_days)    
  week(27,31,calendar,busy_days)
end

calendar = Event.calendar_output
busy_days = events_days(calendar)
month(calendar,busy_days)