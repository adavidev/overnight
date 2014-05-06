require "spec_helper"

module Timely
  describe TimelyService do

    context :start_timer do
      before :each do
        @timer = TimelyService.start_timer(:foo)
      end
      it "should allow users to start and stop clocks" do
        Timer.any_instance.should_receive :start
        TimelyService.start_timer
      end

      it "should return the timer instance when the timer starts" do
        @timer == TimelyService.timers.first[1]
      end

      it "should take a name for the timer being started" do
        TimelyService.start_timer(:foo).should == TimelyService.timers.first[1]
      end
    end

    it "should have a list of timers" do
      TimelyService.timers.should be_a Hash
    end

    it "should allow the user to find a recently created timer by name" do
      TimelyService.start_timer(:foo)
      TimelyService.get_timer(:foo).should == TimelyService.timers[:foo]
      TimelyService.get_timer(:foo).should_not == nil
    end
  end
end
