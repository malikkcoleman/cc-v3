class OrdersController < ApplicationController
  def create
    tax = 1.0

    tax = 1.05 if params[:province] == "AB"
    tax = 1.12 if params[:province] == "BC"
    tax = 1.12 if params[:province] == "MB"
    tax = 1.15 if params[:province] == "NB"
    tax = 1.15 if params[:province] == "NL"
    tax = 1.05 if params[:province] == "NT"
    tax = 1.15 if params[:province] == "NS"
    tax = 1.05 if params[:province] == "NU"
    tax = 1.13 if params[:province] == "ON"
    tax = 1.15 if params[:province] == "PE"
    tax = 1.14975 if params[:province] == "QC"
    tax = 1.11 if params[:province] == "SK"
    tax = 1.05 if params[:province] == "YT"

    total = (params[:total].to_f * tax).round(2).to_s
    logger.debug("BUYING #{params[:total].to_f * tax} BUYING.")
    @order = Order.new
    @order.name = params[:name]
    @order.province = params[:province]
    @order.total = total
    @order.save
    session[:shopping_cart].clear

    @customer = Customer.new
    @customer.name = params[:name]
    @customer.province = params[:province]
    @customer.order_id = @order.id
    @customer.save
    flash[:notice] = "Order #{@order.id} Completed. Confirmation email in 2-3 days."
    redirect_to "/shop"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:name, :province, :total)
  end
end
