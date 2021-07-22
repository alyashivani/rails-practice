class AdminsController < ApplicationController

  before_action :authenticate_admin!

  def authenticate_admin!
    unless current_user && current_user.is_admin?
      redirect_to root_path
    end
  end
end
