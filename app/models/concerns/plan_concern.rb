module PlanConcern
  extend ActiveSupport::Concern

  def streak
    streak = 0
    x = 1 
    while self.completed_for_day?(Date.today - x.day)
      streak += 1
      x += 1
    end
    # if they've completed today add one, but don't invalidate a streak if not
    streak += 1 if self.completed_for_day?(Date.today)
    streak
  end
end