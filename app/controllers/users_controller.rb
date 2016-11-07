class UsersController < ApplicationController

  def show
    if current_user
      @user = User.find_by(id: params[:id])
      @buckelist = @user.list_items.sort{|a,b| a<=>b}
    else
      flash[:notice] = "Please log in to view this page."
      redirect_to '/login'
    end
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
      redirect_to '/users/new'
    end
  end

  def update

    if request.xhr?
      p "************************"
      @comfort = (params[:value].to_f)/1000
      p @comfort
      @user = current_user
      p "************************"
      p @user
      @user.update(comfortzone: @comfort)
      @user.save
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
