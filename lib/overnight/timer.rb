module Overnight
  class Timer
    def start
      @start_time = Timey.new
    end

    def end
      @end_time = Timey.new
    end
  end
end
