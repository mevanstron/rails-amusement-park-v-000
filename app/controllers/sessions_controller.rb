class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user
      session[:user_id] = @user.id if @user.authenticate(params[:user][:password])
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
