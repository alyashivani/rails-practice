class HomeController < ApplicationController
	def index
		if current_user && current_user.is_admin?
			redirect_to admin_dashboards_path
		elsif current_user && current_user.is_approve?
			redirect_to dashboard_home_index_path
		end
	end

	def dashboard
		@products = Product.all
	end

	def show
		
    @product = Product.find(params[:id])
    
  end

	def add_to_cart
		
		@product = Product.find(params[:product_id])

		@cart = current_user.cart

		unless @cart.present?
			@cart = Cart.new(user_id: current_user.id)
			@cart.save
		end

		@cart_item = CartItem.new(cart_id: @cart.id, qty: 1, product_id: @product.id, total_price: @product.price)

		if @cart_item.save
			redirect_to home_index_path
		else
			render :new
		end
	end
end
