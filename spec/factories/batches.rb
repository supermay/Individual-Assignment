FactoryGirl.define do
  factory :batch do
    number    '100'
    start_at  "08/01/2017"
    end_at    "08/31/2017"
    user      {build(:user)}
  end
end
