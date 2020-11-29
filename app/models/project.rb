class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user

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

  def status
    return 'not_started' if tasks.none?

    if tasks.all? { |task| task.complete? }
      'complete'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in_progress'
    else
      'not_started'
    end
  end

  def total_tasks
    tasks.count
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def percent_complete
    return 0 if tasks.none?

    ((total_complete.to_f / total_tasks) * 100).round
  end
end
