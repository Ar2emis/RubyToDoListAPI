class ProjectSerializer < BaseSerializer
  attributes :name
  has_many :tasks
  belongs_to :user
  link :self, :url do |project|
    url_helpers.api_v1_project_url(project)
  end
end
