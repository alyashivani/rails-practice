class Api::V1::SportsController < Api::V1::ApiController

	def index
		@sports = Sport.all
		render json: {data:@sports, message:'loaded successfully', status: 'success'},status: :ok
	end

	def show
		@sport = Sport.find(params[:id])
		render json: {data:@sport, message:'loaded successfully', status: 'success'},status: :ok
	end

	def create
		@sport = Sport.new(sport_params)
		if @sport.save
			render json: {data:@sport, message:'successfully created', status: 'success'},status: :ok
		else
			render error: {error: 'Unable to create sport.'},status: 400
		end
	end

	def update
		@sport = Sport.find(params[:id])
		if @sport
			@sport.update(sport_params)
			
			render json: {data:@sport, message: 'sport successfully updated.', status: 'success'}, status: 200
		else
			render json: {error: 'unable to update sport.'}, status: 400
		end
	end

	def destroy
		@sport = Sport.find(params[:id])
		if @sport
			@sport.destroy
			render json: {message: "sport successfully deleted."}, status: 200
		else
			render json: {error: "unable to delete sport."}, status: 400
		end
	end

	private

	def sport_params
		params.require(:sport).permit(:name)
	end
end