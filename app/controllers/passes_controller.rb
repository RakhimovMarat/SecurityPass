class PassesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pass, only: %i[show edit update]

  def index
    @passes = Pass.all
  end

  def new
    @pass = Pass.new
  end

  def create
    @pass = Pass.new(pass_params)
    if @pass.save
      flash[:success] = 'Pass was created'
      redirect_to @pass
    else
      flash.now[:error] = 'Please fill all fields'
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pass.update(pass_params)
      flash[:success] = 'Pass was updated'
      redirect_to @pass
    else
      flash.now[:error] = 'Please fill all fields'
      render action: 'edit'
    end
  end

  private

  def pass_params
    params.require(:pass).permit(:visitor_firstname, :visitor_lastname, :visit_date, :user_id).merge(user_id: current_user.id)
  end

  def find_pass
    @pass = Pass.find(params[:id])
  end
end
