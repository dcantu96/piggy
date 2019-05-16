class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_accounts, only: [:home]
  layout 'dashboard'

  def home
    # Will create a new account for new users
    @accounts = current_user.accounts
    @goals = current_user.goals

    # Will build a new goal for new users
    @goal = current_user.goals.build if current_user.goals.empty?
  end

  private

  def check_for_accounts
    current_user.accounts.build if current_user.accounts.empty?
    current_user.accounts.first.update_attributes name: 'Wallet'
  end
end
