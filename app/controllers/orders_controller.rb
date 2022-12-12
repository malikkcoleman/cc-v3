class OrdersController < ApplicationController
  def create
    logger.debug("BUYING #{params[:name]} BUYING.")
    @order = Order.new
    @order.name = params[:name]
    @order.province = params[:province]
    @order.total = params[:total]
    @order.save
    session[:shopping_cart].clear

    @customer = Customer.new
    @customer.name = params[:name]
    @customer.province = params[:province]
    redirect_to "/shop"
  end

  def index

  end

  # def show
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:name, :province, :total)
  end
end
