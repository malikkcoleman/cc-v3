class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all.page(params[:page])
    # session[:visit_count] ||= 0
    # session[:visit_count] += 1
    # @visit_count = session[:visit_count]
  end

  def show
    @product = Product.where(id: params[:id])
  end

  def search
    # wildcard_search = "%#{params[:keywords]}%"
    if params[:ccs].empty?
      # @products = Product.where(category_id: params[:ccs]).where("name LIKE ? OR description LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")
      @products = Product.where("name LIKE ?", "%" + params[:q] + "%")
    else
      # @products = Product.where("name LIKE ?", "%" + params[:q] + "%")
      @products = Product.where(category_id: params[:ccs]).where("name LIKE ? OR description LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")
    end
    # @products = Product.where("name LIKE ?", "%" + params[:q] + "%")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :qty, :search)
  end
end
