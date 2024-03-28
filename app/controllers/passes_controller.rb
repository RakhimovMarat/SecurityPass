# frozen_string_literal: true

class PassesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pass, only: %i[show edit update]

  def index
    if current_user.admin? || current_user.guard?
      @q = Pass.ransack(params[:q])
      @pagy, @passes = pagy(@q.result.includes(:user).order(visit_date: :asc), items: 3)
    else
      @q = current_user.passes.ransack(params[:q])
      @pagy, @passes = pagy(@q.result.order(visit_date: :asc), items: 3)
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
      render :new
    end
  end

  def show; end

  def edit
    authorize @pass
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
    @pass.update!(status: params[:status]) if params[:status].present?
    flash[:success] = 'Статус изменен'
    authorize @pass
    redirect_to @pass
  end

  def only_created
    if current_user.admin? || current_user.guard?
      @q = Pass.ransack(params[:q])
      @pagy, @passes = pagy(@q.result.where(status: :created).includes(:user).order(visit_date: :asc), items: 3)
      render :index
    else
      @q = current_user.passes.ransack(params[:q])
      @pagy, @passes = pagy(@q.result.where(status: :created).order(visit_date: :asc), items: 3)
      render :index
    end
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
    @pass = Pass.find_by(id: params[:id])
    render_404 unless @pass
  end
end
