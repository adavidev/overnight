module Overnight
  class OvernightService
    @@timers = {}

    # start a timer with a name
    # if a name is not selected, then a random one will be assigned
    def self.start_timer(timer_name = nil)
      timer_name ||= self.random_timer_name
      @@timers[timer_name] = Timer.new.start
      return @@timers[timer_name]
    end

    # stops a timer with either the actual timer or the name
    # just in case there wasnt a name passed when the timer was started
    def self.stop_timer(timer)
      (@@timers[timer] || @@timers.values.select{|e| e == timer}.first).stop
    end

    # get all of the timers
    def self.timers
      return @@timers
    end

    # get a single timer by name
    def self.get_timer(timer_name)
      return @@timers[timer_name]
    end

    private

    # the random timer name generator
    def self.random_timer_name
      (0...16).map { (65 + rand(26)).chr }.join.to_sym
    end
  end
end
