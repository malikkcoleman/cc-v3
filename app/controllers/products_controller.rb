class ProductsController < ApplicationController

  def index
    @category = Category.find(params[:id])
    @products = Product.where(category_id: params[:id])
    @categories = Category.all
  end

  def show

  end

end
