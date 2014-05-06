require "spec_helper"

module Timely
  describe Timer do
    context :start do
      it "should create a timey object" do
        Timey.should_receive(:new)
        Timer.new.start
      end
    end

    context :end do
      it "should cerate a timey object" do
        Timey.should_receive(:new)
        Timer.new.end
      end
    end
  end
end
