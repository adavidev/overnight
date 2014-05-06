require "spec_helper"

module Overnight
  describe OvernightService do

    context :start_timer do
      before :each do
        @timer = OvernightService.start_timer(:foo)
      end
      it "should allow users to start and stop clocks" do
        Timer.any_instance.should_receive :start
        OvernightService.start_timer
      end

      it "should return the timer instance when the timer starts" do
        @timer == OvernightService.timers.first[1]
      end

      it "should take a name for the timer being started" do
        OvernightService.start_timer(:foo).should == OvernightService.timers.first[1]
      end
    end

    context :stop_timer do
      before :each do
        @timer = OvernightService.start_timer(:foo)
      end

      it "should stop a timer with a given name" do
        OvernightService.get_timer(:foo).should_receive :stop
        OvernightService.stop_timer(:foo)
      end

      it "should return the timer being stopped" do
        OvernightService.stop_timer(:foo).should == OvernightService.get_timer(:foo)
      end

      it "should should also work with a timer object" do
        OvernightService.stop_timer(OvernightService.get_timer(:foo)).should == OvernightService.get_timer(:foo)
      end
    end

    it "should have a list of timers" do
      OvernightService.timers.should be_a Hash
    end

    it "should allow the user to find a recently created timer by name" do
      OvernightService.start_timer(:foo)
      OvernightService.get_timer(:foo).should == OvernightService.timers[:foo]
      OvernightService.get_timer(:foo).should_not == nil
    end
  end
end
