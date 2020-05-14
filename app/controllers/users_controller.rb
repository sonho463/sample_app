class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # debugger
  end
  
  def new
    @user = User.new
    # debugger
  end
  
  def create
    @user = User.new(user_params)
    # debugger
    if @user.save
      #保存成功時の処理
      redirect_to @user
      flash[:success] = "Welcome to the sample app!"
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email,
                                   :password, :password_confirmation)
    end
  

end