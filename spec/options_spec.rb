require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'rubberband-audio'

describe RubberBand::Options do
  describe "basic" do
    it "should use quite" do
      RubberBand::Options.new.to_s.should =~ /-q/
    end
  end
  
  describe "configurable parameters" do
    it "should support time" do
      o = RubberBand::Options.new(:time => "360")
      o.to_s.should =~ /--time 360/
    end
    
    it "should support tempo" do
      o = RubberBand::Options.new(:tempo => 360)
      o.to_s.should =~ /--tempo 360/
    end

    it "should support duration" do
      o = RubberBand::Options.new(:duration => 200)
      o.to_s.should =~ /--duration 200/
    end

    it "should support pitch" do
      o = RubberBand::Options.new(:pitch => 4)
      o.to_s.should =~ /--pitch 4/
    end

    it "should support frequency" do
      o = RubberBand::Options.new(:frequency => 4)
      o.to_s.should =~ /--frequency 4/
    end
    
    it "should support timemap" do
      o = RubberBand::Options.new(:timemap => "/tmp/file0123")
      o.to_s.should =~ %r{--timemap "/tmp/file0123"}
    end

    it "should support crispness"
    it "should support format"
    it "should support precise"
    it "should support realtime mode"
    it "should support debug"
  end
end
