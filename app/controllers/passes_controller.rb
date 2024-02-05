class PassesController < ApplicationController
  def index
    @passes = Pass.all
  end

  def show
    @pass = Pass.find(params[:id])
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

  private

  def pass_params
    params.require(:pass).permit(:visitor_firstname, :visitor_lastname, :visit_date, :user_id).merge(user_id: current_user.id)
  end
end
