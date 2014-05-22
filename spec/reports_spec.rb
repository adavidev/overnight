require "spec_helper"

module Overnight
  describe Report do
    before :each do
    end

    it "should create a file called profile" do
      File.should_receive(:new).with("profile", 'w')
      Report.new
    end

    # context :build_report do
    #   it "should compile a list of timers and the length of time they took" do
    #     true.should == false
    #   end
    # end

    context :write do
      it "should write to the file whatever is sent in" do
        File.any_instance.should_receive(:syswrite).with("abcdef")
        @report = Report.new
        @report.write("abcdef")
      end
    end
  end
end
