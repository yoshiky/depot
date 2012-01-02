class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  before_filter :initialize_session
  
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
    def increment_count
      if session[:count].nil?
        session[:count] = 0
      end
      session[:count] += 1
    end
    
    def initialize_session
      session[:count] ||= 0
    end
    
end
