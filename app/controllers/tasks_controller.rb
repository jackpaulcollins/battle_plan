class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.turbo_stream { render turbo_stream: turbo_stream.append('plan_tasks', "<li>#{@task.description}</li>")}
      end
    end
  end
private

  def task_params
    params.require(:task).permit(:description, :plan_id, :user_id)
  end
end
