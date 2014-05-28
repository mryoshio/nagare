FactoryGirl.define do

  factory :place do

    factory :entrance_place, aliases: [:at_entrance] do
      name "entrance"
    end

    factory :living_place, aliases: [:at_living] do
      name "living"
    end

  end

end
