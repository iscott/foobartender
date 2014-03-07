# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drink do
    alcohol "gin"
    mixer "tonic"
    finish "lime"
    over_ice true
    price 8
    top_shelf true
  end
end
