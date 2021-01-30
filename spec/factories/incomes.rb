FactoryBot.define do
  factory :income do
    title { 'salary' }
    salary { 300_000 }
    salary_date { '2021-01-23' }
  end
end
