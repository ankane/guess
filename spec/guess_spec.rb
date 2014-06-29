require "spec_helper"

describe Guess do

  context "male name" do
    subject { Guess.gender("Don Draper") }

    it { expect(subject[:gender]).to eq("male") }
    it { expect(subject[:confidence]).to be_within(0.1).of(0.99) }
  end

  context "female name" do
    subject { Guess.gender("Betty Draper") }

    it { expect(subject[:gender]).to eq("female") }
    it { expect(subject[:confidence]).to be_within(0.1).of(0.99) }
  end

  context "unknown name" do
    subject { Guess.gender("Mad Men") }

    it { expect(subject[:gender]).to eq("unknown") }
    it { expect(subject[:confidence]).to be_nil }
  end

  context "nil name" do
    subject { Guess.gender(nil) }

    it { expect(subject[:gender]).to eq("unknown") }
    it { expect(subject[:confidence]).to be_nil }
  end

  context "last name, first name" do
    subject { Guess.gender("Draper, Don") }

    it { expect(subject[:gender]).to eq("male") }
    it { expect(subject[:confidence]).to be_within(0.1).of(0.99) }
  end

end
