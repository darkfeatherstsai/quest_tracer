class QuestsController < ApplicationController
  before_action :find_quest, only: [:edit, :update, :destroy]
  before_action :check_login

  def index
    @q = Quest.ransack(params[:q])
    quests = @q.result.ransack(user_id_eq: current_user.id)
    @quests = quests.result.paginate(:page => params[:page] , :per_page => 15)
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.user_id = current_user.id

    if @quest.save
      redirect_to quests_path, notice: "任務新增成功！"
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
  def quest_params
    params.require(:quest).permit(:title, :content, :start_date, :end_date, :priority, :state, :user_id)
  end

  def find_quest
    @quest = Quest.find_by(id: params[:id])
  end
end
