FactoryGirl.define do
  factory :student do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    picture     "http://p4.isanook.com/mv/0/ud/11/55301/minguk-crying.jpg"
    batch     {build(:batch)}
  end
end
