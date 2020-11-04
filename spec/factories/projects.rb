FactoryBot.define do
  factory :project do
    name { FFaker::Music.song }
    user
  end
end
