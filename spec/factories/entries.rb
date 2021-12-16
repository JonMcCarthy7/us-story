FactoryBot.define do
  factory :entry do
    title { "MyString" }
    description { "MyText" }
    start_date { "2021-12-14" }
    end_date { "2021-12-14" }
    entry_type { "MyString" }
    type { "" }
    status { "MyString" }
    user { nil }
    relationship { nil }
    entry { nil }
  end
end
