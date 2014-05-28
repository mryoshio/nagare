require 'spec_helper'

describe Patient do

  subject { Patient.new }

  it { expect(subject).to be_an_instance_of(Patient) }

end
