class FeedbacksController < ApplicationController

	def index
		@feedbacks = Feedback.all.where(product_id: params[:product_id])
	end

	# def feedback_save
	# 	@feedback = Feedback.new(product_id: @product_id, message: @message, username: current_user.name)
	# 	if @feedback.save
	# 		redirect_to feedbacks_path
	# 	end
	# end

	def new
    @feedback = Feedback.new
  end

  def create

  	@product = Product.find(params[:product_id])
    @feedback = @product.feedbacks.new(feedback_params)

    @f = Feedback.all.where(username: current_user.name, message: @feedback.message)
    
    if @f.exists?

    	redirect_to home_path(@product), notice: "Already same feedback message given by you....try different feedback"
    else
	    if Order.exists?(user_id: current_user.id) and OrderItem.exists?(product_id: @product, order_id: Order.select(:id).where(user_id: current_user.id))
		    if @feedback.save
		      redirect_to home_path(@product)
		    else
		    	redirect_to :new
		    end
		  else
		  	redirect_to home_path(@product), notice: "You can not give feedback because you didn't order something"
		  end
		end
  end

  private

  	def feedback_params
  		params.require(:feedback).permit(:@product, :message, :username, :ratings, images: [])
  	end

end
