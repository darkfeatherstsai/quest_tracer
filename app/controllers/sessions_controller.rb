class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, flash: {success: "登入成功"}
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, flash: {success: "已登出"}
  end
end
