class CompletionsController < ApplicationController
  def create
    @completion = Completion.new(
        completable_id: completion_params[:completable_id], 
        completable_type: completion_params[:completable_type],
        completed_on: Time.new.to_date, 
        user_id: current_user.id 
      )

    respond_to do |format|
      if @completion.save
        format.html { redirect_to plan_url(completion_params[:plan_id]), notice: "Task Completed." }
      else
        format.html { redirect_to :back, alert: @completion.errors.full_messages[0] }
      end
    end
  end

  def destroy
    @completion = Completion.where(completable_id: completion_params[:completable_id], completable_type: completion_params[:completable_type], completed_on: Time.now.to_date).last
    respond_to do |format|
      if @completion.destroy
        format.html { redirect_to plan_url(completion_params[:plan_id]), notice: "Task marked incomplete." }
      else
        format.html { redirect_to :back, alert: @completion.errors.full_messages[0] }
      end
    end
  end

  private

  def completion_params
    params.permit(:completable_id, :completable_type, :user_id, :plan_id)
  end
end
