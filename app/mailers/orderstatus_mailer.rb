class OrderstatusMailer < ApplicationMailer

	def order_status
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.find(@order.user_id).email, subject: 'Your order status')
  end

end
