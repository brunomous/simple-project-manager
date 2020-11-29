class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['not_started', 'in_progress', 'complete'] }

  STATUS_OPTIONS = [
    ['Not started', 'not_started'],
    ['In progress', 'in_progress'],
    ['Complete', 'complete']
  ]

  def badge_color
    case status
    when 'not_started'
      'secondary'
    when 'in_progress'
      'info'
    when 'complete'
      'success'
    end
  end

  def complete?
    status == 'complete'
  end

  def in_progress?
    status == 'in_progress'
  end

  def not_started?
    status == 'not_started'
  end
end
