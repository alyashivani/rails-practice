class Api::V1::OrderItemsController < Api::V1::ApiController

	def index
		@order_items = OrderItem.where(order_id: params[:order_id])
		render json: {data:@order_items, message:'loaded successfully', status: 'success'},status: :ok
	end
end