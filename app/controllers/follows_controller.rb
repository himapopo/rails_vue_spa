class FollowsController < ApplicationController
  before_action :follow_user
  def create
    @user = User.find_by(id: params[:follow][:user_id])
    @follow_user = User.find_by(id: params[:follow][:follow_id])
    @follow = @follow_user.follow(@user)
    render json: { message: "ユーザーをフォローしました" , followees: @followees, followers: @followers}
  end

  def destroy
  end

  private

  def follow_user
    @user = User.find_by(id: params[:follow][:user_id])
    @followees = @user.followees
    @followers = @user.followers
  end
end
