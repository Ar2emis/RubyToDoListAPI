class TaskSerializer < BaseSerializer
  attributes :name, :position, :due_date, :done
  has_many :comments
end
