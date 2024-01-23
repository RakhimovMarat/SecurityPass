class PassesController < ApplicationController
  def index
    @passes = Pass.all
  end

  def show
    @pass = Pass.find(params[:id])
  end
end
