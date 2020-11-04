class Task::Contracts::Update < ApplicationContract
  property :name
  property :due_date

  validation do
    config.messages.backend = :i18n
    config.messages.namespace = :task

    params do
      optional(:name).filled
      optional(:due_date).maybe(:filled?)
    end

    rule(:due_date) do
      next unless values[:due_date]

      date = Time.zone.parse(value.to_s)
      date ? (key.failure(:future?) if date <= Time.zone.now) : key.failure(:time_zone?)
    end
  end
end
