class UsersController < ApplicationController
  # userモデルにpassword password_confirmation カラムがないため
  # ラップされる[:user]キーを外す。
  wrap_parameters :user, include: [:name, :email, :password, :password_confirmation, :avatar]
  def index
    @users = User.all
    render json: { data: @users }, status: 200
  end

  def create 
    @user = User.new(user_params)
    @users = User.all
    begin
      if @user.save
      #  @user.parse_base64(params[:avatar])
        render json: {data: @users, message: "登録完了"}, status: 200
      else
        render json: {data: @user, message: @user.errors}, status: 400
      end
    rescue => exception
      render json: { data: @user, message: @user.errors}, status: 404
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
    @users = User.all
    if session[:user_id] != nil 
      render json: { data: @users, message: "ログインしてます"}, status: 404
    else
      if @user = User.find_by(email: params[:email]).authenticate(params[:password])
        session[:user_id] = @user.id
        render json: { data: @user, message: "ログインしました"}, status: 200
      else
        render json: { data: @users, message: "no!!"}, status: 400
      end
    end
  end

  def sign_out
    @users = User.all
    session[:user_id] = nil
    render json: { data: @users, message: "ログアウトしました" }, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
