module Overnight
  class Timer
    attr_reader :start_time, :end_time

    def start
      @start_time ||= Time.now
      self
    end

    def stop
      @end_time ||= Time.now
      self
    end

    def elapsed_time
      @end_time - @start_time
    end
  end
end
