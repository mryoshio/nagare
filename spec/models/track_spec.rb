require 'spec_helper'

describe Track do
  subject { Track.new }

  it { expect(subject).to be_an_instance_of(Track) }

  describe "association" do
    it { expect(subject).to belong_to(:beacon) }
    it { expect(subject).to belong_to(:receiver) }
  end
end
