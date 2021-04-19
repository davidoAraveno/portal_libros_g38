class UsersController < ApplicationController
  def index
    @user = User.find(session[:user])
  end

  def create
    if params[:user][:name]
      @user = User.new(user_params)
      @user.save
      session[:user] = @user.id
      redirect_to root_path, notice: 'inscripcion exitosa'
    end
  end

  def log_in
    @user = User.find(params[:id_user])
    if @user
      session[:user] = @user.id
      redirect_to root_path
    else
      redirect_to root_path, notice: 'no pudiste ser identificado'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end



  private

  def user_params
    params.require(:user).permit(:name)
  end
end
