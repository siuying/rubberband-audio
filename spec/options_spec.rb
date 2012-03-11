require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'rubberband-audio'

describe Rubberband::Options do
  describe "basic" do
    it "should use quite" do
      Rubberband::Options.new.to_s.should =~ /-q/
    end
  end
  
  describe "configurable parameters" do
    it "should support time"
    it "should support tempo"
    it "should support duration"
    it "should support pitch"
    it "should support frequency"
    it "should support timemap"
    it "should support crispness"
    it "should support format"
    it "should support precise"
    it "should support realtime mode"
    it "should support debug"
  end
end
