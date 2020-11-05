FactoryBot.define do
  factory :comment do
    body { FFaker::Lorem.sentence }
    task

    after(:build) { |comment| comment.image = Rack::Test::UploadedFile.new('spec/fixtures/files/image.jpg') }
  end
end
