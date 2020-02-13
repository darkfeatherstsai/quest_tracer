class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to quests_path, notice: "註冊成功！"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @quest.update(quest_params)
      redirect_to quests_path, notice: "任務更新成功！"
    else
      render :new
    end
  end

  def destroy
    @quest.destroy if @quest
    redirect_to quests_path, notice: "任務已刪除！"
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
