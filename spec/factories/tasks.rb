FactoryBot.define do
  factory :task do
    name { FFaker::Music.song }
    done { false }
    due_date { Time.zone.tomorrow + 1 }
    project { create(:project) }
    position { project.tasks.count }
  end
end
