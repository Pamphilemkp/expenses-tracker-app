class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.author = @user

    if @group.save
      flash[:sucess] = 'group successfully Created'
      redirect_to groups_path
    else
      flash.now[:error] = 'error creating group, please try again'
      render new_group_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
