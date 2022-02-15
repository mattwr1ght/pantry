class HomeController < ApplicationController
  def index
    @items = FoodItem.all
  end

  def show
    @item = FoodItem.find(params[:id])
  end
end
