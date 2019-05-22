class ExpensesController < ApplicationController
  before_action :set_account, only: [:new, :create]
  before_action :set_expense, only: [:edit, :update, :show]
  layout 'dashboard'
  def index
    @expenses = Account.find(params[:account_id]).expenses
  end

  def show
  end

  def new
    @expense = @account.expenses.new
  end

  def edit
  end

  def create
    @expense = @account.expenses.build(expense_params)
    if @expense.save
      if @expense.check_limit?
        UserNotifierMailer.send_category_limit_alert(current_user, root_url).deliver
        flash[:alert] = "You have reached the category's weekly limit."
      end
      redirect_to root_path, notice: 'Expense was successfully created.'
    else
      flash[:error] = @expense.errors.full_messages
      render :new
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to root_path, notice: 'Expense was successfully updated.'
    else
      flash[:error] = @expense.errors.full_messages
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to root_url, notice: 'Expense was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:expense_id])
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_params
      params.require(:expense).permit :name, :amount, :date, :account_id, :category_id
    end
end
