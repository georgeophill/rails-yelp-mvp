class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
  @restaurant = Restaurant.new(set_params)
  @restaurant.save
  redirect_to restaurant_path(@restaurant)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaruant.find(params[:id])
    @restaurant = Restaruant.update(params[:restaurant])
    redirect_to restaurant_path(@restaurant)

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
