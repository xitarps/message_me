class UsersController < ApplicationController
  before_action :redirect_if_already_signed_in, only: %i[new create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      set_user_cookie
      redirect_to users_path(@user.id), notice: 'Usuário criado com sucesso'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      set_user_cookie
      redirect_to users_path(@user.id), notice: 'Modificação concluída.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    
    redirect_to users_url, notice: 'Descadastrado :(.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(session[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end

    def set_user_cookie
      cookies[:username] = @user.username || 'guest'
    end
end
