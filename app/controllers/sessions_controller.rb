class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    # debugger

    if @user && @user.authenticate(params[:session][:password])
      #ログイン後にユーザー情報ページへリダイレクト
      log_in @user
       params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
      # debugger
    else
      #エラーメッセージを作成（flash)
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    # debugger
    redirect_to root_url
  end
end
