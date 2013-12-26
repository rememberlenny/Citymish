class UsersController < ApplicationController

  def index
    @user = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

end
