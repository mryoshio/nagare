FactoryGirl.define do

  factory :receiver do
    factory :a01_receiver, aliases: [:receiver01] do
      name        "a01"
      description "number: a01, high-spec model"
    end

    factory :a02_receiver, aliases: [:receiver02] do
      name        "a02"
      description "number: a02, low-spec model"
    end
  end

end
