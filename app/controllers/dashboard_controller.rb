class DashboardController < ApplicationController
  before_action :ensure_logged_in, only: :show

  def show
    
  end
end
