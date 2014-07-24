require 'spec_helper'

describe Patient do
  subject { Patient.new }

  it { expect(subject).to be_an_instance_of(Patient) }

  describe 'association' do
    it { expect(subject).to have_many(:beacon_holders) }
    it { expect(subject).to have_many(:beacons).through(:beacon_holders) }
  end
end
