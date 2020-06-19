FactoryBot.define do
  factory :user do
    username {Faker::Name.name}
    email {Faker::Internet.email}
    password {Settings.password_default}
    password_confirmation {Settings.password_default}
    role {Settings.role.admin}
  end
end
