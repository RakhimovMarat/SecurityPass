class UserController < ApplicationController
  def index
    @users = User.all
  en
end
