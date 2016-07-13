require 'faker'

FactoryGirl.define do
  factory :observation do
    sequence(:created_by) { |n| n } 
    sighted_at Time.now
    description "animal"
    pic "https://upload.wikimedia.org/wikipedia/commons/0/0b/Proteles_cristatus1.jpg"
    sequence(:phone) { |n| "+1919#{n}5555555" }
    user
  end
end
