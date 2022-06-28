class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create!(toy_params)
    render json: toy, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    toy = toy_find
    toy.update(toy_params)
    render json: toy
  end

  def increase_likes
    toy = toy_find
    toy.update(likes: + 1)
    render json: toy
  end


  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

  def toy_find
    toy = Toy.find(params[:id])
  end

end
