require 'spec_helper'

describe Place do

  subject { Place.new }

  it { expect(subject).to be_an_instance_of(Place) }

end
