class RolesController < ApplicationController
  before_action :authenticate_user!

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = 'Role was created'
      redirect_to @role
    else
      flash.now[:error] = 'Please fill all fields'
      render action: 'new'
    end
  end

  def show
    @pass = Pass.find(params[:id])
  end

  private

  def role_params
    params.require(:role).permit(:rolename)
  end
end
