class Admin::AdminController < ApplicationController
  before_action :check_admin
  layout "admin"

  def check_admin
    unless current_user && current_user.authority
      flash[:warning] = '權限不符'
      redirect_to root_path
    end
  end
end
