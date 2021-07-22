class OrdersController < ApplicationController
	def index
		@orders = Order.all.where(user_id: current_user.id)
	end

	def yourOrder
		@orderitems = OrderItem.all.where(order_id: params[:order_id])
	end

	def order_placed
		
		@user = current_user

		@addcart_item = CartItem.all
		
		@order = Order.new(orderDate: Time.current.to_date, user_id: @user.id, orderTotalPrice: 0, status: "Placed")
		
		if @order.save
			@price_update = 0
			@addcart_item.each do |cart|
				
				@orderitem = OrderItem.new(qty: cart.qty, unit_price: Product.find(cart.product_id).price, total_price: cart.total_price, product_id: cart.product_id, order_id: @order.id)
				
				if @orderitem.save
					@price_update += @orderitem.total_price

				end
			end
			
			@order.update(orderTotalPrice: @price_update)
			Cart.delete_all
			CartItem.delete_all

			OrderMailer.with(user: @user, order: @order).order_detail.deliver_now

			redirect_to orders_path
		else
			render :new
		end
	end
end
