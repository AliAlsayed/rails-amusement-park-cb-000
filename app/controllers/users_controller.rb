class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation,
      :happiness, :height, :nausea, :tickets, :admin)
    end

    def require_login
      redirect_to root_url unless current_user
    end
end
