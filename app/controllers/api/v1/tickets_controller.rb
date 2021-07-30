class Api::V1::TicketsController < Api::V1::ApiController

	def index
		@tickets = Ticket.where(sport_id: params[:sport_id])
		render json: {data:@tickets, message:'loaded successfully', status: 'success'},status: :ok
	end

	def show
		@ticket = Ticket.find(params[:id])
		render json: @ticket 
	end

	def create
		@ticket = Ticket.new(ticket_params)
		if @ticket.save
			render json: {data:@ticket, message:'successfully created', status: 'success'},status: :ok
		else
			render error: {error: 'Unable to create ticket.'},status: 400
		end
	end

	def update
		@ticket = Ticket.find(params[:id])
		if @ticket
			@ticket.update(ticket_params)
			render json: {data:@ticket, message: 'ticket successfully updated.', status: 'success'}, status: 200
		else
			render json: {error: 'unable to update ticket.'}, status: 400
		end
	end

	def destroy
		@ticket = Ticket.find(params[:id])
		if @ticket
			@ticket.destroy
			render json: {message: "ticket successfully deleted."}, status: 200
		else
			render json: {error: "unable to delete ticket."}, status: 400
		end
	end

	private

	def ticket_params
		params.permit(:category,:booked_at,:price,:sport_id)
	end
end