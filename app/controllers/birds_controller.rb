class BirdsController < ApplicationController
  before_action :birds
  def index
    render json: JSON.pretty_generate({ data: @birds.as_json }), status: 200
  end

  def show
    @bird = Bird.find_by(id: params[:id])
    @user = @bird.user
    @likes = @bird.likes
    # バードモデルに紐付いたユーザーと気になるを別のデータで返す
    render json: JSON.pretty_generate({ data: @bird.as_json, user: @user.as_json, like: @likes.as_json }), status: 200
  end

  def create
    @bird = Bird.new(bird_params)
    if @bird.save
      render json: { data: @bird, message: "鳥さんを投稿しました" }, status: 200  
    else
      render json: { data: @bird, message: @bird.errors.full_messages }, status: 400
    end
  end

  def update
  end

  def destroy
  end

  private 

  def birds
    # バードモデルに紐付けたユーザーも一緒に返す。
    @birds = Bird.joins(:user).includes(:user).order(id: :desc).select('users.name as user_name, users.*')
  end

  def bird_params
    params.require(:bird).permit(:name, :size, :age, :details, :image1, :image2, :image3, :user_id, :sex)
  end
end
