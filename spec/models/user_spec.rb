require 'spec_helper'

describe User do

  subject { User.new }

  it { expect(subject).to be_an_instance_of User }

  describe "association" do
    it { expect(subject).to belong_to(:group) }
  end

end
