class UsersController < ApplicationController
  # userモデルにpassword password_confirmation カラムがないため
  # ラップされる[:user]キーを外す。
  wrap_parameters :user, include: [:name, :email, :password, :password_confirmation, :avatar, :area, :profile]
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
    render json: { data: @users, message: "ログインしてます"}, status: 404 if session[:user_id] != nil 
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
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
    render json: { data: @users, message: "ログアウトしました" }, status: 200
  end

  def likes
    @likes = User.find_by(id: params[:user_id]).likes.order(id: :desc).includes(:likes)
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :area, :profile)
  end

  def user_all
    @users = User.all.order(id: :desc)
  end
end
