module Overnight
  class Timer
    attr_reader :start_time, :end_time

    def start
      @start_time ||= Timey.new
      self
    end

    def stop
      @end_time ||= Timey.new
      self
    end
  end
end
