require "spec_helper"

module Overnight
  describe Timer do
    context :start do
      it "should create a timey object" do
        Time.should_receive(:now)
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
        Time.should_receive(:now)
        Timer.new.stop
      end

      it "should return the same timey object if done twice" do
        @timer = Timer.new
        @timey = @timer.stop.end_time
        @timer.stop.end_time.should == @timey
      end
    end

    context :elapsed_time do
      it "should return the delta between the two times" do
        @timer = Timer.new
        @timer.start
        @timer.stop
        @timer.elapsed_time.should == @timer.end_time - @timer.start_time
      end
    end
  end
end
