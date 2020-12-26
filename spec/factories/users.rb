FactoryBot.define do
  factory :taiki, class: User do
    name { "taiki" }
    area { "gihu" }
    profile { "test" }
    password { "000000" }
    email { "test@taiki" }
  end

  factory :nattu, class: User do
    name { "nattu" }
    area { "gihu" }
    profile { "test" }
    password { "000000" }
    email { "test@nattu" }
  end
end
