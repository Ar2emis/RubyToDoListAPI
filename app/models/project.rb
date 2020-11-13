class Project < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :tasks, -> { order(:position) }, inverse_of: :project, dependent: :destroy
end
