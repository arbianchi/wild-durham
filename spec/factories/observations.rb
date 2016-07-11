require 'faker'

FactoryGirl.define do
  factory :observation do |f|
    f.created_by 1
    f.sighted_at Time.now
    f.description "animal"
    f.pic "https://upload.wikimedia.org/wikipedia/commons/0/0b/Proteles_cristatus1.jpg"
    f.phone "+19195555555"
  end
end
