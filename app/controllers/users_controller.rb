class UsersController < ApplicationController
  # userモデルにpassword password_confirmation カラムがないため
  # ラップされる[:user]キーを外す。
  wrap_parameters :user, include: [:name, :email, :password, :password_confirmation, :avatar]
  before_action :user_all
  def index
    render json: { data: @users }, status: 200
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
    @pastuser = User.find(params[:id])
    @user = User.find(params[:id])
    @user.avatar = params[:avatar]
    if @user.save
      render json: {data: @user, message: "画像変更"}, status: 200  
    else
      render json: {data: @pastuser, message: "画像変更できませんでした"}, status: 400
    end
  end

  def sign_in
    render json: { data: @users, message: "ログインしてます"}, status: 404 if session[:user_id] != nil 
    if @user = User.find_by(email: params[:email]).authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { data: @user, message: "ログインしました"}, status: 200
    else
      render json: { message: "パスワード又はメールアドレスが間違っています"}, status: 400
    end
  end

  def sign_out
    session[:user_id] = nil
    render json: { data: @users, message: "ログアウトしました" }, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def user_all
    @users = User.all
  end
end
