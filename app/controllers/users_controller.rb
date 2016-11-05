class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @buckelist = @user.list_items
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/login'
    else
      flash[:notice] = "Please complete all fields."
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
