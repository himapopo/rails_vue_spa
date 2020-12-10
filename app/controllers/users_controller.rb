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
    if @user.save
      render json: {data: @users, message: "登録完了"}, status: 200
    else
      render json: {data: user_params, message: @user.errors}, status: 400
    end
  end

  def sig_in
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
    
    else

    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
