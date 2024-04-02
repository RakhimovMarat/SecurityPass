# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[edit update show]

  def index
    @users = User.all.order(id: :asc)
    authorize @users
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Изменения сохранены'
      redirect_to @user
    else
      flash.now[:error] = 'Пожалуйста заполните все поля'
      render action: 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:role_id)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
