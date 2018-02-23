class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    if !logged_in
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = @user.errors
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
