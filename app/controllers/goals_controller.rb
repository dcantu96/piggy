class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :show]
  layout 'dashboard'
  def index
    @goals = current_user.goals

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  def show
  end

  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  def edit
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to root_path, notice: 'Goal was successfully created.'
    else
      flash[:error] = @goal.errors.full_messages
      render :new
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to root_path, notice: 'Goal was successfully updated.'
    else
      flash[:error] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to root_url, notice: 'Goal was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goal_params
      params.require(:goal).permit :name, :completion_date, :amount, :user_id
    end
end
