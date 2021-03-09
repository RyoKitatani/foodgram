class FoodsController < ApplicationController
  def index
    @foods = Food.all
    @food = Food.new
  end

  def show
  end

  def edit
  end
end
