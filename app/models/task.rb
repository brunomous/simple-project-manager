class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['not_started', 'in_progress', 'complete'] }

  STATUS_OPTIONS = [
    ['Not started', 'not_started'],
    ['In progress', 'in_progress'],
    ['Complete', 'complete']
  ]
end
