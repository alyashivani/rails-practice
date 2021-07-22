class Admin::OrdersController < AdminsController
	def index
		@orders = Order.all
	end

  def update_status
    @upstatus = Order.where(id: params[:id]).update(status: params[:status])

    @order = Order.find(params[:id])
    @user = User.where(id: @order.user_id)
    

    OrderstatusMailer.with(user: @user, order: @order).order_status.deliver_now

    redirect_to admin_orders_path
  end
	
end