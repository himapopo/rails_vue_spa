class BirdsController < ApplicationController
  before_action :birds
  def index
    render json: { data: @birds }
  end

  def show
  end

  def create
    @bird = Bird.new(bird_params)
    if @bird.save
      render json: { data: @birds, message: "鳥さんを投稿しました" }, status: 200  
    else
      render json: { data: @bird, message: @bird.errors.full_message }, status: 400
    end
  end

  def update
  end

  def destroy
  end

  private 

  def birds
    @birds = Bird.all.includes(:user).order(id: :desc)
  end

  def bird_params
    params.require(:bird).permit(:type, :size, :age, :details, :image1, :image2, :image3, :user_id)
  end
end
