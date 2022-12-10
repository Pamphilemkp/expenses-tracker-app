class EntitiesController < ApplicationController
  load_and_authorize_resource

  def new
    @entity = Entity.new
    @category = Group.find(params[:group_id])
  end

  def create
    @user = current_user
    @entity = Entity.new(entity_params)
    @category = Group.find(params[:group_id])
    @entity.author = @user
    @entity.group = @category

    if @entity.save
      flash[:sucess] = 'entity successfully Created'
      redirect_to groups_path, notice: 'Success'
    else
      flash.now[:error] = 'error creating entity, please try again'
      render 'new', notice: 'Error'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
