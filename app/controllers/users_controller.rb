class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:show, :edit, :update, :destroy  ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to user_path(user.id)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_user_path(user.id)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to stores_path
  end

  private

  def user_params
        params.require(:user).permit(:name, :email, :kana, :nickname )
  end

end
