FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    start_date { "2021-12-06" }
    end_date { "2021-12-06" }
    event_type { "MyString" }
    status { "MyString" }
    user { nil }
    relationship { nil }
    event_id { nil }
  end
end
