class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show edit update destroy ]
  helper_method :plan_date

  def plan_date
    date = params[:date].presence || Date.today.to_s
    return Date.parse date
    rescue Date::Error
      Date.today
  end

  # GET /plans or /plans.json
  def index
    if !current_user
      redirect_to :root
    else
      user_id = User.find(current_user.id).id
      @plans = Plan.where(user: user_id)
    end

    render_to_string @plans
  end

  # GET /plans/1 or /plans/1.json
  def show
    @task = Task.new(user_id: current_user)
  end

  # GET /plans/new
  def new
    redirect_to :root if !current_user
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans or /plans.json
  def create
    @plan = Plan.new(title: plan_params[:title], user_id: current_user.id)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to plan_url(@plan), notice: "Plan was successfully created." }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1 or /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to plan_url(@plan), notice: "Plan was successfully updated." }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1 or /plans/1.json
  def destroy
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to plans_url, notice: "Plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:user_id, :title, :date)
    end
end
