class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.where(id: params[:id])
  end

  def search
    # wildcard_search = "%#{params[:keywords]}%"
    @products = Product.where("name LIKE ?", "%" + params[:q] + "%")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :qty, :search)
  end
end
