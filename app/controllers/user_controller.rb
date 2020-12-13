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
        flash[:notice] = "ログインしました"
        session[:login_id] = @user.id
        redirect_to("/task/index")
      end
    else
      flash[:alert] = "ユーザIDまたはパスワードが誤っています"
      redirect_to("/user/login")
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new
    @user.user_name = params[:user_name]
    @user.login_id = params[:login_id]
    @user.password = params[:password]

    if @user.save
      flash[:notice] = "「#{@user.user_name}」を追加しました。"
      redirect_to('/login')
    else
      flash[:alert] = "入力内容に誤りがあります。ご確認ください。"
      render("user/new")
    end
  end
end
