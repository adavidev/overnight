require "spec_helper"

module Overnight
  describe Timer do
    context :start do
      it "should create a timey object" do
        Timey.should_receive(:new)
        Timer.new.start
      end

      it "should return the same timey object if done twice" do
        @timer = Timer.new
        @timey = @timer.start.start_time
        @timer.start.start_time.should == @timey
      end
    end

    context :stop do
      it "should create a timey object" do
        Timey.should_receive(:new)
        Timer.new.stop
      end

      it "should return the same timey object if done twice" do
        @timer = Timer.new
        @timey = @timer.stop.end_time
        @timer.stop.end_time.should == @timey
      end
    end
  end
end
