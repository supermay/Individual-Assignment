FactoryGirl.define do
  factory :batch do
    number    '100'
    start     "08/01/2017"
    self.end  "08/31/2017"
    user      {build(:user)}
  end
end
