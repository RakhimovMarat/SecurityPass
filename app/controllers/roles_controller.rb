# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :authenticate_user!

  def index
    @roles = Role.all
    authorize @roles
  end

  def new
    @role = Role.new
    authorize @role
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
