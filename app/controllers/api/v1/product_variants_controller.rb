class Api::V1::ProductVariantsController < Api::V1::ApiController

	def index
		@pro_vars = ProductVariant.where(product_id: params[:product_id])
		render json: {data:@pro_vars, message:'loaded successfully', status: 'success'},status: :ok
	end

end