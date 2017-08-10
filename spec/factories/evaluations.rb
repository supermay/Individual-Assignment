FactoryGirl.define do
  factory :evaluation do
    time         "2017-08-08"
    color        "GREEN"
    remark       "okay"
    student      {build(:student)}
  end
end
