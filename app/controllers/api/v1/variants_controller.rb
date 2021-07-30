class Api::V1::VariantsController < Api::V1::ApiController

	def index
		@variants = Variant.all
		render json: {data:@variants, message:'loaded successfully', status: 'success'},status: :ok
	end

	def show
		@variant = Variant.find(params[:id])
		render json: {data:@variant,attributes: @variant.variant_attributes, message:'loaded successfully', status: 'success'},status: :ok
	end

	def create
		@variant = Variant.new(variant_params)
		byebug
		if @variant.save
			render json: {data:@variant, message:'successfully created', status: 'success'},status: :ok
		else
			render error: {error: 'Unable to create variant.'},status: 400
		end
	end

	def update
		@variant = Variant.find(params[:id])
		if @variant
			@variant.update(variant_params)
			
			render json: {data:@variant, message: 'variant successfully updated.', status: 'success'}, status: 200
		else
			render json: {error: 'unable to update variant.'}, status: 400
		end
	end

	def destroy
		@variant = Variant.find(params[:id])
		if @variant
			@variant.destroy
			render json: {message: "variant successfully deleted."}, status: 200
		else
			render json: {error: "unable to delete variant."}, status: 400
		end
	end

	private

	def variant_params
		
		params.require(:variant).permit(:name, variant_attributes_attributes: [:id, :name, :_destroy])
	end
end