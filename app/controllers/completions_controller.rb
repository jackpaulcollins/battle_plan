class CompletionsController < ApplicationController
  include CompletionConcern

  def create
    @completion = Completion.new(
        completable_id: completion_params[:completable_id], 
        completable_type: completion_params[:completable_type],
        completed_on: Date.parse(completion_params[:plan_date]), 
        user_id: current_user.id 
      )

    respond_to do |format|
      if @completion.save
        if @completion.completable_type == "Task" && 
          does_completion_complete_plan_for_day?(completion_params[:plan_id], completion_params[:plan_date])
          @plan_completion = Completion.new(
            completable_id: completion_params[:plan_id], 
            completable_type: "Plan",
            completed_on: Date.parse(completion_params[:plan_date]), 
            user_id: current_user.id 
          )

          @plan_completion.save
        end
        format.html { redirect_to plan_path(completion_params[:plan_id], date: Date.parse(completion_params[:plan_date])), notice: "Task Completed." }
      else
        format.html { redirect_to :back, alert: @completion.errors.full_messages[0] }
      end
    end
  end

  def destroy
    @completion = Completion.where(completable_id: completion_params[:completable_id], completable_type: completion_params[:completable_type], completed_on: Date.parse(completion_params[:plan_date])).last
    respond_to do |format|
      if @completion.destroy
        if @completion.completable_type == "Task" && does_destroying_completion_incomplete_plan_for_day?(completion_params[:plan_id], completion_params[:plan_date])
          @plan_completion = Completion.where(completable_id: completion_params[:plan_id], completable_type: "Plan", completed_on: Date.parse(completion_params[:plan_date])).last
          @plan_completion.destroy
        end
        format.html { redirect_to plan_path(completion_params[:plan_id], date: Date.parse(completion_params[:plan_date])), notice: "Task marked incomplete." }
      else
        format.html { redirect_to :back, alert: @completion.errors.full_messages[0] }
      end
    end
  end

  private

  def completion_params
    params.permit(:completable_id, :completable_type, :user_id, :plan_id, :plan_date)
  end
end
