FactoryGirl.define do

  factory :user do
    factory :mike_user do
      name                   "mike"
      email                  "mike@example.com"
      password               "mike1234"
      password_confirmation  "mike1234"
    end
  end

end
