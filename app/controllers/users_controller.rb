class UsersController < ApplicationController

  def big
  end

  def show
    if current_user
      @user = User.find_by(id: params[:id])
      @buckelist = @user.list_items.sort{|a,b| a<=>b}
      if @user.personality
        @findtype = @user.personality.convert_to_mb
        @type = Type.find_by(title: @findtype)
      end
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
      session[:user_id] = @user.id
      redirect_to new_personality_path	
    else
      flash[:notice] = "Please complete all fields."
      redirect_to '/users/new'
    end
  end

  def update
    if request.xhr?
      @comfort = (params[:value].to_f)/100
      @user = current_user
      @user.update(comfortzone: @comfort)
      @user.save
    end
  end

  def share
    @user = User.find_by(id: params[:id])
    @buckelist = @user.list_items.sort{|a,b| a<=>b}
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
