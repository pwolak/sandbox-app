class StoreController < ApplicationController

  helper_method :current_user

  def index
    @products =  Product.find_products_for_sale
    @cart = find_cart
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    if current_user
      @cart.add_product(product)
    end
    #redirect_to_index
    respond_to do |format|
      format.js
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index("Your cart is currently empty")
  end

private
  def find_cart
    session[:cart] ||= Cart.new
  end

  def redirect_to_index(msg=nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
