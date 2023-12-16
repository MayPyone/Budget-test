class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[index new create]

  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities
  end

  def new
    @entity = @group.entities.build
    @groups = current_user.groups
  end

  def create
    @entity = current_user.entities.build(entity_params)
    @groups = current_user.groups


    if @entity.save
      redirect_to group_path(@group)
    else
      render :new

    end
  end

  private

  def entity_params
    params.require(:entity).permit(:entity_name, :amount, :group_id)
  end

  def set_group
    @group = Group.find_by(id: params[:group_id])
  end
end
