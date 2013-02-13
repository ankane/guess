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

  context "last name, first name" do
    subject { Guess.gender("Draper, Don") }

    it { subject[:gender].should == "male" }
    it { subject[:confidence].should be_within(0.1).of(0.99) }
  end

  context "male gendered he" do
    subject { Guess.gendered_form_of(:they, "Don Draper") }
    it { subject.should == "he" }
  end
  context "male gendered his" do
    subject { Guess.gendered_form_of(:their, "Don Draper") }
    it { subject.should == "his" }
  end
  context "male gendered his (alt)" do
    subject { Guess.gendered_form_of(:theirs, "Don Draper") }
    it { subject.should == "his" }
  end
  context "female gendered she" do
    subject { Guess.gendered_form_of(:they, "Betty Draper") }
    it { subject.should == "she" }
  end
  context "female gendered her" do
    subject { Guess.gendered_form_of(:their, "Betty Draper") }
    it { subject.should == "her" }
  end
  context "female gendered hers" do
    subject { Guess.gendered_form_of(:theirs, "Betty Draper") }
    it { subject.should == "hers" }
  end
  context "unknown gendered they" do
    subject { Guess.gendered_form_of(:they, "Mad Men") }
    it { subject.should == "they" }
  end
  context "unknown gendered their" do
    subject { Guess.gendered_form_of(:their, "Mad Men") }
    it { subject.should == "their" }
  end
  context "unknown gendered theirs" do
    subject { Guess.gendered_form_of(:theirs, "Mad Men") }
    it { subject.should == "theirs" }
  end

end
