class UsersController < ApplicationController
  # userモデルにpassword password_confirmation カラムがないため
  # ラップされる[:user]キーを外す。
  wrap_parameters :user, include: [:name, :email, :password, :password_confirmation, :avatar, :area, :profile, :cookie]
  before_action :user_all
  def index
    render json: JSON.pretty_generate({ data: @users.as_json }), status: 200
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: {data: @user, message: "登録完了"}, status: 200
    else
      render json: {data: @user, message: @user.errors.full_messages}, status: 400
    end
  end

  def show
    @user = User.find(params[:id])
    render json: { data: @user }, status: 200
  end

  def imagechange
    @postuser = User.find(params[:id])
    @user = User.find(params[:id])
    @user.avatar = params[:avatar]
    if @user.save
      render json: {data: @user, message: "画像変更"}, status: 200  
    else
      render json: {data: @postuser, message: "画像変更できませんでした"}, status: 400
    end
  end

  def sign_in
    return if session[:user_id] != nil
    # render json: { data: @users, message: "ログインしてます"}, status: 404 
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        @user.update(cookie: params[:cookie])
        cookies.permanent.signed[:user_id] = @user.id if @user.cookie == true
        session[:user_id] = @user.id
        render json: { data: @user, message: "ログインしました"}, status: 200
      else
        render json: { message: "パスワード又はメールアドレスが間違っています"}, status: 400
      end
    else
      render json: { message: "パスワード又はメールアドレスが間違っています"}, status: 400
    end
  end

  def sign_out
    session[:user_id] = nil
    if cookies.signed[:user_id] != nil
      @user = User.find_by(id: cookies.signed[:user_id])
      cookies[:user_id] = nil
      @user.update(cookie: false)
    end
    render json: { data: @users, message: "ログアウトしました" }, status: 200
  end

  def likes
    @likes = User.find_by(id: params[:user_id]).likes.order(id: :desc)
    @birds = @likes.map do |like|
      like.bird
    end
    @likes = @birds.map do |bird|
      bird.likes
    end
    render json: { data: @birds, like: @likes}, status: 200
  end

  def birds
    @birds = User.find_by(id: params[:user_id]).birds.order(id: :desc)
    @likes = @birds.map do |bird|
      bird.likes
    end
    render json: { data: @birds, like: @likes }, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :area, :profile, :cookie)
  end

  def user_all
    @users = User.all.order(id: :desc)
  end
end
