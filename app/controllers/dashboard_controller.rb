class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_accounts, only: [:home]
  layout 'dashboard'

  def home
    # Will create a new account for new users
    @account = current_user.account
    @goals = current_user.goals

    # Will build a new goal for new users
    
  end

  private

  def check_for_accounts
    if current_user.account.nil?
      current_user.create_account name: 'Wallet'
    end
  end
end
