class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_admin_actions,  only: [:index, :new, :create, :edit, :update]

  def home
    @user = current_user
  end

  def index
    @users  = User.all.includes(:profile, :user_type)
  end

  def new
    @user         = User.new
    @user.profile = Profile.new
  end

  def edit
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to users_path, notice: 'Usuário criado com sucesso'
    else
      render  :new
    end
  end

  def update
    if @user.update user_params
      redirect_to users_path, notice: 'Dados atualizados com sucesso'
    else
      render  :edit
    end
  end

  def edit_password
    @user = current_user
  end

  def update_password
    debug params
    @user = User.find current_user.id
    if @user.update_with_password(user_password_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, bypass: true
      redirect_to root_path, notice: 'Senha atualizada com sucesso'
    else
      render :edit_password
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :username, :password, :password_confirmation, :user_type_id, :active, profile_attributes: [:id, :name])
  end

  def user_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
