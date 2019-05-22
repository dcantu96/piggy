class AccountIncomesController < ApplicationController
  before_action :set_account, only: [:new, :create, :index]
  before_action :set_income, only: [:edit, :update, :show]
  layout 'dashboard'
  def index
    @incomes = Account.find(params[:account_id]).incomes
  end

  def show
  end

  def new
    @income = @account.incomes.new
  end

  def edit
  end

  def create
    @income = @account.incomes.build(income_params)
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

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a trusted parameter "white list" through.
    def income_params
      params.require(:income).permit :name, :amount, :date, :account_id
    end
end
