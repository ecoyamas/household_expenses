FactoryBot.define do
  factory :expense do
    title { "MyString" }
    price { 1 }
    using_date { "2021-02-21" }
  end
end
