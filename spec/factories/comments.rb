FactoryBot.define do
  factory :comment do
    user { nil }
    item { nil }
    content { "MyText" }
    deleted_at { "2020-05-04 13:52:00" }
  end
end
