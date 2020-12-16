class BirdsController < ApplicationController
  before_actions :birds
  def index
    render json: { data: @birds}
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private 

  def birds
    @birds = Bird.all
  end
end
