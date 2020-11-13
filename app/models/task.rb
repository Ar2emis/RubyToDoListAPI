class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :project
  acts_as_list scope: :project
  has_many :comments, dependent: :destroy
end
