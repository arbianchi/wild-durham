FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user+#{n}@example.com" }
    password        "password"
    permission      ["admin","nil"].sample
  end
end
