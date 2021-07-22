class CartsController < ApplicationController

	def index
		@cart_items = CartItem.all
	end

	def edit
    @cart_item = CartItem.find(params[:id])
  end

  def update
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(product_params)
      redirect_to @carts
    else
      render :edit
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    redirect_to carts_path
  end


  def update_qty

    @product_price = Product.find(CartItem.find(params[:cart_id]).product_id).price
    
    @upqty = CartItem.where(id: params[:cart_id]).update(qty: params[:qty], total_price: @product_price * params[:qty].to_f)

    
    redirect_to carts_path
  end

  


	private
	def product_params
		params.require(:addcartItem).permit(:name, :price, :availability, :manf_date, :avatar)
	end
end


