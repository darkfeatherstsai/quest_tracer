class Admin::UsersController < Admin::AdminController
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    @users = User.page(params[:page]).per(5)
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
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "會員資料更新成功！"
    else
      render :edit
    end
  end

  def destroy
    if User.count > 1
      @user.destroy if @user
      redirect_to admin_users_path, notice: "會員資料已刪除！"
    else
      redirect_to admin_users_path, notice: "管理人數只剩一人，無法刪除"
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :authority)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
