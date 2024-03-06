class PassesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pass, only: %i[show edit update]

  def index
    # role_id == 4 - admin, role_id == 3 - guard
    if current_user.role_id == 4 || current_user.role_id == 3
      @passes = Pass.all.order(visit_date: :asc)
    else
      @passes = current_user.passes.order(visit_date: :asc)
    end
  end

  def new
    @pass = Pass.new
  end

  def create
    @pass = Pass.new(pass_params)
    if @pass.save
      flash[:success] = 'Пропуск был создан'
      redirect_to @pass
    else
      flash.now[:error] = 'Пожалуйста заполните все поля'
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pass.update(pass_params)
      flash[:success] = 'Изменения сохранены'
      redirect_to @pass
    else
      flash.now[:error] = 'Пожалуйста заполните все поля'
      render action: 'edit'
    end
  end

  def change_status
    @pass = Pass.find(params[:id])
    if params[:status].present?
      @pass.update!(status: params[:status])
    end
    redirect_to @pass, notice: 'Pass status was upadted'
  end

  private

  def pass_params
    params.require(:pass).permit(:visitor_firstname,
                                 :visitor_lastname,
                                 :visit_date,
                                 :user_id,
                                 :status,
                                 :visitor_company,
                                 :identity_document)
                                 .merge(user_id: current_user.id)
  end

  def find_pass
    @pass = Pass.find(params[:id])
  end
end
