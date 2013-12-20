class TicketsController < ApplicationController
	def new
	end

	def index
		@tickets = Ticket.all
	end

	def create
		@ticket = Ticket.new(post_params)
		@ticket.save
		redirect_to @ticket
	end

	def show
		@ticket = Ticket.find(params[:id])
	end

	private
	  def post_params
	    params.require(:ticket).permit(:name)
	  end
end
