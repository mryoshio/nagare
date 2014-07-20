# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :track do
    beacon_id 1
    receiver_id 1
    patient_name "MyString"
    place_name "MyString"
  end
end
