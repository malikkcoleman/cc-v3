class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    # session[:visit_count] ||= 0
    session[:shopping_cart] ||= []
  end

  def cart
    Product.find(session[:shopping_cart])
  end

  # def increment_visit_count
  #   session[:visit_count] += 1
  # end

  # def visit_count
  #   session[:visit_count]
  # end
end
