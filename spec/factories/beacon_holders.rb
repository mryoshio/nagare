FactoryGirl.define do

  factory :beacon_holder do
    factory :taro_holder do
      association :beacon, factory: :navy_beacon
      association :patient, factory: :taro
    end

    factory :jiro_holder do
      association :beacon, factory: :blue_beacon
      association :patient, factory: :jiro
    end
  end

end
