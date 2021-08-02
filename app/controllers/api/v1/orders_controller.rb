class Api::V1::OrdersController < Api::V1::ApiController

	def index
		@orders = Order.where(user_id: params[:user_id])
		render json: {data:@orders, message:'loaded successfully', status: 'success'},status: :ok
	end

end