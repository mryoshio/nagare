FactoryGirl.define do

  factory :beacon do
    factory :navy_beacon do
      uuid "993003d4-c0ad-46d1-8cd7-38cfb8aadb7f"
      major 1
      minor 1
      color "navy"
      name "entrance"
    end

    factory :blue_beacon do
      uuid "da703781-97d7-454b-b6cd-8afab6988666"
      major 2
      minor 1
      color "blue"
      name "living"
    end
  end

end
