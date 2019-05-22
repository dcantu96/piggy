class IncomesController < ApplicationController
  before_action :set_goal, only: [:new, :create]
  before_action :set_income, only: [:edit, :update, :show]
  layout 'dashboard'
  def index
    @incomes = Goal.find(params[:goal_id]).incomes
  end

  def show
  end

  def new
    @income = @goal.incomes.new
  end

  def edit
  end

  def create
    @income = @goal.incomes.build(income_params)
    if @income.save
      redirect_to root_path, notice: 'Income was successfully created.'
    else
      flash[:error] = @income.errors.full_messages
      render :new
    end
  end

  def update
    if @income.update(income_params)
      redirect_to root_path, notice: 'Income was successfully updated.'
    else
      flash[:error] = @income.errors.full_messages
      render :edit
    end
  end

  def destroy
    @income.destroy
    redirect_to root_url, notice: 'Income was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:income_id])
    end

    def set_goal
      @goal = Goal.find(params[:goal_id])
    end

    # Only allow a trusted parameter "white list" through.
    def income_params
      params.require(:income).permit :name, :amount, :date, :account_id, :goal_id
    end
end
