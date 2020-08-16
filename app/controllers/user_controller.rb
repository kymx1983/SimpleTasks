class UserController < ApplicationController
  def edit
  end

  def login

  end

  def login_check
    @user = User.find_by(login_id: params[:login_id])
    # @user = User.find_by(id: 1)

    if @user
      puts "パスワード"
      puts params[:password]
      puts @user.id
      puts @user.password
      if @user.password == params[:password]
        puts "ログインに成功しました"
        session[:login_id] = @user.id
        redirect_to("/task/index")
      end
    else
      puts "ログインに失敗しました"
      redirect_to("/user/login")
    end
  end

  def new
  end

  def show
  end

  def create
    @user = User.new
    @user.user_name = params[:user_name]
    @user.login_id = params[:login_id]
    @user.password = params[:password]
    @user.save

    redirect_to("/user/login")
  end
end
