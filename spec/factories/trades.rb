FactoryBot.define do
    factory :user do
      email { 'user@example.com' }
      password { 'password' }
    end
    factory :wallet do
      balance { 0 }
      association :user
    end
  end