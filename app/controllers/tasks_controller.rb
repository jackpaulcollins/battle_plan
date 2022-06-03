class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to plan_url(@task.plan.id), notice: "Task added" }
      end
    end
  end

private

  def task_params
    params.require(:task).permit(:description, :plan_id, :user_id)
  end
end
