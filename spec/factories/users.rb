FactoryBot.define do
  factory :user do
    username { FFaker::Internet.user_name }
    password { FFaker::Internet.password }

    factory :new_user do
      password_confirmation { password }
    end
  end
end
