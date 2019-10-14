
require_relative 'event'
class Calendar

  def self.events_days(calendar_array)
    busy_days=[]
    for i in 0..calendar_array.size-1
      busy_days << calendar_array[i].start_date.strftime("%d").to_i
    end
    return busy_days
  end

  def self.line_1
    puts "-"*70
  end

  def self.line_2 (monday,sunday)
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

  def self.line_3 (monday, sunday, calendar, busy_days)
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

  def self.line_4 (monday, sunday, calendar, busy_days)
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

  def self.line_5 (monday, sunday, calendar, busy_days)
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

  def self.line_6 (monday, sunday, calendar, busy_days)
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

  def self.line_7
    puts "-"*70
  end

  def self.week(monday,sunday,calendar,busy_days)
    Calendar.line_2(monday,sunday)
    Calendar.line_3(monday,sunday,calendar,busy_days)
    Calendar.line_4(monday,sunday,calendar,busy_days)
    Calendar.line_5(monday,sunday,calendar,busy_days)
    Calendar.line_6(monday,sunday,calendar,busy_days)
    Calendar.line_7
  end

  def self.month_oct19(calendar,busy_days)
    Calendar.line_1
    Calendar.week(0,6,calendar,busy_days)
    Calendar.week(7,13,calendar,busy_days)
    Calendar.week(14,20,calendar,busy_days)
    Calendar.week(21,27,calendar,busy_days)    
    Calendar.week(27,31,calendar,busy_days)
    puts "pour ajouter un evenement entrer EventCreator.create"
  end

  def self.display
    calendar_array = Event.calendar_output
    busy_days = Calendar.events_days(calendar_array)
    Calendar.month_oct19(calendar_array,busy_days)
  end
end