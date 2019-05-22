class ProfileController < ApplicationController
  layout 'dashboard'
  def show
    @profile = current_user
  end
end
