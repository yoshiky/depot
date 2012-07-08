class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @count = increment_count
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.atom
      format.opds {render :opds => @products}
    end

  end

end
