require 'spec_helper'

describe Beacon do
  subject { Beacon.new }

  it { expect(subject).to be_an_instance_of(Beacon) }

  describe 'association' do
    it { expect(subject).to have_many(:beacon_holders) }
    it { expect(subject).to have_many(:patients).through(:beacon_holders) }
  end
end
