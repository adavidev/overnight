require "spec_helper"

module Overnight
  describe ReportBuilder do
    context :build_report do
      xit "should compile a list of timers and the length of time they took" do
        OvernightService.start_timer
      end
    end
  end
end
