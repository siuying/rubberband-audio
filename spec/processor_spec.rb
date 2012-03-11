require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'rubberband-audio'

describe RubberBand::Processor do
  subject { RubberBand::Processor.new("a", "b") }
  
  it "should return path" do
    subject.binary.should =~ /rubberband/
  end
end