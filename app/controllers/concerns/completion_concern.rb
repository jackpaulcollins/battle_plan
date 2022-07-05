# frozen_string_literal: true

module CompletionConcern
  extend ActiveSupport::Concern

  def does_completion_complete_plan_for_day?(plan_id, day)
    plan = Plan.find(plan_id)
    day = Date.parse(day)
    plan.tasks.all? { |task| task.completed_for_day?(day) }
  end

  def does_destroying_completion_incomplete_plan_for_day?(plan_id, day)
    return if !Completion.where(completable_type: "Plan", completable_id: plan_id, completed_on: day).exists?
    plan = Plan.find(plan_id)
    day = Date.parse(day)
    !plan.tasks.all? { |task| task.completed_for_day?(day) }
  end
end