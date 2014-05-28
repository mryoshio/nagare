FactoryGirl.define do

  factory :station do
    factory :entrance_station do
      association :place, factory: :at_entrance
      association :receiver, factory: :receiver01
    end

    factory :living_station do
      association :place, factory: :at_living
      association :receiver, factory: :receiver02
    end
  end

end
