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
      flash[:success] = 'Роль была создана'
      redirect_to @role
    else
      flash.now[:error] = 'Пожалуйста заполните все поля'
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
