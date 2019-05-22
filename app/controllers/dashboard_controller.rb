class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_accounts, only: [:home]
  layout 'dashboard'

  def home
    # Will create a new account for new users
    @account = current_user.account
    @goals = current_user.goals

    # Will build a new goal for new users
    @goal = current_user.goals.build if current_user.goals.empty?
  end

  private

  def check_for_accounts
    if current_user.account.nil?
      current_user.account.build
      current_user.account.first.update_attributes name: 'Wallet'
    end
  end
end
