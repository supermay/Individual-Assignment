FactoryGirl.define do
  factory :batch do
    number    '100'
    start_at  { Faker::Date.backward(14) }
    end_at    { Faker::Date.forward(100) }
    user      {build(:user)}
  end
end
