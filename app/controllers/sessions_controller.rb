class SessionsController < ApplicationController
  before_action :redirect_if_already_signed_in, only: %i[new create]
  #after_action :set_user_cookie, only: %i[create]
  def new
    @user = User.new()
  end
  def create
    @user = User.find_by(username: user_params[:username])
    (@user.nil?)? (@user = User.find_by(email: user_params[:username])) : (p 'not found')

    if @user && @user.authenticate(user_params[:password])
      flash[:notice] = "Olá, logado(a) com: #{@user.email}"
      session[:user_id] = @user.id
      set_user_cookie
      redirect_to root_path
    else
      @user = User.new(email: user_params[:email] ,password: user_params[:password])
      flash.now[:alert] = "Ops! Algo errado com esse email ou senha..."
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Deslogado com sucesso"
    redirect_to login_path
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user_cookie
    cookies[:username] = @user.username || 'guest'
  end
end
