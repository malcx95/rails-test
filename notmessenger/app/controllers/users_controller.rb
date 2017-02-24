class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]

  def index
    @users = User.all
  end

  def show
    redirect_to users_path
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User successfully created, you twat."}
      else
        format.html { render :new }
      end
    end
  end

  def new
    @user = User.new
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User deleted"}
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
