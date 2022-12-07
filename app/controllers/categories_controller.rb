class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.where(id: params[:id])
  end

end
