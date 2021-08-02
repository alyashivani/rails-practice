class Api::V1::FeedbacksController < Api::V1::ApiController

	def index
		@feedbacks = Feedback.where(product_id: params[:product_id])
		render json: {data:@feedbacks, message:'loaded successfully', status: 'success'},status: :ok
	end

	def create
		@feedback = Feedback.new(feedback_params)
		if @feedback.save
			render json: {data:@feedback, message:'successfully created', status: 'success'},status: :ok
		else
			render error: {error: 'Unable to create feedback.'},status: 400
		end
	end

	private

	def feedback_params
		params.require(:feedback).permit(:product_id, :message, :username, :ratings)
	end
end