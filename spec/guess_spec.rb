require "spec_helper"

describe Guess do

  context "male name" do
    subject { Guess.gender("Don Draper") }

    it { subject[:gender].should == "male" }
    it { subject[:confidence].should be_within(0.1).of(0.99) }
  end

  context "female name" do
    subject { Guess.gender("Betty Draper") }

    it { subject[:gender].should == "female" }
    it { subject[:confidence].should be_within(0.1).of(0.99) }
  end

  context "unknown name" do
    subject { Guess.gender("Mad Men") }

    it { subject[:gender].should == "unknown" }
    it { subject[:confidence].should == nil }
  end

  context "nil name" do
    subject { Guess.gender(nil) }

    it { subject[:gender].should == "unknown" }
    it { subject[:confidence].should == nil }
  end

end
