class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    
    if login(email,password)
      flash[:success] = "ログインに成功しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  def login(email,password)
    @user = User.find_by(email: email)
    
    # 条件Aと条件Bがどちらもtrueならばtrueを返す
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    end
  end
end
