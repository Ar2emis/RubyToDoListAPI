class Task::Contracts::Position < ApplicationContract
  delegate :project_id, :id, to: :model
  property :id, virtual: true
  property :project_id, virtual: true
  property :position

  validation do
    config.messages.backend = :i18n
    config.messages.namespace = :task

    params do
      required(:position).filled
      required(:project_id).filled
      required(:id).filled
    end

    rule(:position, :project_id, :id) do
      position = values[:position].to_i
      key.failure(:valid?) unless position >= 0 && position < Task.where(project_id: values[:project_id]).count
      key.failure(:same?) if Task.exists?(id: values[:id], position: values[:position])
    end
  end
end
