require 'spec_helper'

describe Group do
  subject { Group.new }

  it { expect(subject).to be_an_instance_of Group }

  describe "association" do
    it { expect(subject).to have_many(:users) }
  end
end
