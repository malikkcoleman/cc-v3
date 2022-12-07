class ProductsController < ApplicationController

  def show
    @product = Product.where(id: params[:id])
  end

end
