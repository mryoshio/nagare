require 'spec_helper'

describe Beacon do

  subject { Beacon.new }

  it { expect(subject).to be_an_instance_of(Beacon) }

end
