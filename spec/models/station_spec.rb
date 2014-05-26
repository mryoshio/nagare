require 'spec_helper'

describe Station do

  subject { Station.new }

  it { expect(subject).to be_an_instance_of(Station) }

end
