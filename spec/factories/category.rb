FactoryBot.define do
  factory :category do
    title {Faker::Job.title}
    description {Faker::Lorem.sentence}
  end
end
