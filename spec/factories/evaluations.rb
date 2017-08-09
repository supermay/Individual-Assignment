FactoryGirl.define do
  factory :evaluation do
    time         "2017-08-08"
    color        "green"
    remark       "okay"
    student      {build(:student)}
  end
end
