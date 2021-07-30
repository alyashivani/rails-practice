class Api::V1::ProductsController < Api::V1::ApiController

	def index
		@products = Product.all
		render json: @products
	end

	def show
		@product = Product.find(params[:id])
		render json: @product 
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			render json: @product
		else
			render error: {error: 'Unable to create product.'},status: 400
		end
	end

	def update
		@product = Product.find(params[:id])

		if @product

			@product.update(product_params)
			
			render json: {data:@product, message: 'product successfully updated.'}, status: 200
		else
			render json: {error: 'unable to update product.'}, status: 400
		end
	end

	def destroy
		@product = Product.find(params[:id])
		if @product
			@product.destroy
			render json: {message: "product successfully deleted."}, status: 200
		else
			render json: {error: "unable to delete product."}, status: 400
		end
	end

	private

	def product_params
		params.require(:product).permit(:name,:price,:availability,:manf_date)
	end
end
