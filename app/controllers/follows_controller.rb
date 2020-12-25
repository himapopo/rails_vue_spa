class FollowsController < ApplicationController
  before_action :follow_user
  def create
    @follow = @current_user.follow(@user)
    render json: { message: "ユーザーをフォローしました" , followees: @followees, followers: @followers}
  end

  def destroy
    @current_user.unfollow(@user)
    render json: { message: "フォローを外しました" , followees: @followees, followers: @followers}
  end

  private

  def follow_user
    @user = User.find_by(id: params[:follow][:user_id])
    @followees = @user.followees
    @followers = @user.followers
    @current_user = User.find_by(id: params[:follow][:follow_id])
  end
end
