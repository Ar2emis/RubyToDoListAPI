class Task::Contracts::Create < ApplicationContract
  property :name

  validation do
    params do
      required(:name).filled
    end
  end
end
