FactoryBot.define do
  factory :post do
    title {Faker::Job.title}
    description {Faker::Lorem.sentence}
    salary {"15000000"}
    address {Faker::Address.city}
    target_type {"fulltime"}
    start_date {"2020-06-02"}
    end_date {"2020-06-02"}

    association :user
    association :category
  end
end
