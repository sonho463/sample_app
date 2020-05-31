class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
    # debugger
  end
  
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
      log_in @user
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      #更新失敗
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
    logger.debug("[debug] users#destroy")
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email,
                                  :password, :password_confirmation)
    end
    
# beforeアクション

# ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

# 正しいユーザーかどうかを確認  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  #管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
end