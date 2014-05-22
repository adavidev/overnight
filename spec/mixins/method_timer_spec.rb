require "spec_helper"
module Overnight

    class TestClass

      def foo
        "bar"
      end

      def bar
        "baz"
      end

      def baz(baz)
        baz
      end

      include Overnight::MethodTimer
    end

    describe MethodTimer do
      context :inclusion do
        it "should create a timer object every time a method is called" do
          TestClass.new.foo
          Overnight::OvernightService.get_timer(:overnight_test_class_foo).should_not == nil
        end

        it "should call start_timer for every time a method is called with the name of the method called" do
          OvernightService.should_receive(:start_timer).with(Overnight::MethodTimer.timer_name(TestClass.name + "_foo"))
          TestClass.new.foo
        end

        it "should call stop_timer with the same arguments as the started time" do
          OvernightService.should_receive(:stop_timer).with(Overnight::MethodTimer.timer_name(TestClass.name + "_foo"))
          TestClass.new.foo
        end

        it "should call the original method with the original arguments" do
          TestClass.new.baz("test").should == "test"
        end
      end

      context :timer_name do
        it "should create a snake_case string out of the given string" do
          Overnight::MethodTimer.timer_name("Overnight::TestClass_foo").should == :overnight_test_class_foo
        end
      end
    end
end
