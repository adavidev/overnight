require "spec_helper"

module Timely
  describe Timey do
    it "should hold a time on create" do
      Timey.new.get.should be_a Time
    end

    it "should hold on to the time it had on creation" do
      timey = Timey.new
      time = timey.get
      timey.get.should == time
    end
  end
end
