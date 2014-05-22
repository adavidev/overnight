module Overnight
  class Report
    def initialize
      @report = File.new 'profile', 'w'
    end

    def write(line)
      @report.syswrite(line)
    end
  end
end
