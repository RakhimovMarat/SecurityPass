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
    @pass.save
    redirect_to @pass
  end

  private

  def pass_params
    params.require(:pass).permit(:visitor_firstname, :visitor_lastname, :visit_date, :user_id).merge(user_id: current_user.id)
  end
end
