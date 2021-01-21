FactoryBot.define do
  factory :follow do
    association :user, factory: :nattu
    association :follow, factory: :taiki
  end
end
