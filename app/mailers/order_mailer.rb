class OrderMailer < ApplicationMailer

  def order_detail
    @user = params[:user]
    @order = params[:order]
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Your order detail')
  end
end
