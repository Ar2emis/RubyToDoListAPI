FactoryBot.define do
  factory :comment do
    body { FFaker::Lorem.sentence }
    task
  end
end
