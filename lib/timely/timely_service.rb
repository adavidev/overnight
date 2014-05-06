module Timely
  class TimelyService
    @@timers = {}

    def self.start_timer(timer_name = nil)
      timer_name ||= self.random_timer_name
      @@timers[timer_name] = Timer.new.start
      return @@timers[timer_name]
    end

    def self.stop_timer(timer)

    end

    def self.timers
      return @@timers
    end

    def self.get_timer(timer_name)
      return @@timers[timer_name]
    end

    private

    def self.random_timer_name
      (0...8).map { (65 + rand(26)).chr }.join.to_sym
    end
  end
end
