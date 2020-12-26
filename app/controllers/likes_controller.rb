class LikesController < ApplicationController
  before_action :bird
  def create
   @like = Like.new(like_params)
   if @like.save
    render json: {data: @bird, like: @bird.likes, user: @bird.user, message: "気になる鳥さんに追加しました" }, status: 200
   else
    render json: { message: "気になるリストに追加できませんでした"}, status: 400
   end
  end


  def destroy
    if @like = Like.find_by(like_params)
      @like.destroy
      render json: {data: @bird, like: @bird.likes, user: @bird.user, message: "気になる鳥さんから外しました" }, status: 200
    else
      render json: { message: "エラーです"}, status: 400
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :bird_id)
  end

  def bird
    @bird = Bird.find_by(id: params[:like][:bird_id])
  end
end
