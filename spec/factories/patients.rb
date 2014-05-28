FactoryGirl.define do

  factory :patient do
    factory :taro_patient, aliases: [:taro] do
      name "taro"
    end

    factory :jiro_patient, aliases: [:jiro] do
      name "jiro"
    end
  end

end
