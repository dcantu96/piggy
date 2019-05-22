class AccountsController < ApplicationController
  before_action :set_account, only: [:edit, :update, :show]
  layout 'dashboard'

  def show
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to root_path, notice: 'Account was successfully updated.'
    else
      flash[:error] = @account.errors.full_messages
      render :edit
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit :name, :user_id
    end
end
