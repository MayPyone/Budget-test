class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def new
    @group = current_user.groups.build
  end

  def show
    @group = Group.find_by(id: params[:id])
    @entities = @group.entities
    @total_amount = @entities.sum(:amount)
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'one group was successfully created.'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:group_name, :icon)
  end
end
