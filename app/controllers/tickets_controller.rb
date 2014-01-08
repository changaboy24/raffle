class TicketsController < ApplicationController
	def new
		@ticket = Ticket.new
	end

	def index
		@tickets = Ticket.all
	end

	def create
		@ticket = Ticket.new(post_params)
		if @ticket.save
		  redirect_to @ticket
		else
			render 'new'
		end
	end

	def edit
		@ticket = Ticket.find(params[:id])
	end
	
	def update
		@ticket = Ticket.find(params[:id])
		if params.has_key?(:ticket)
			@ticket.update(params[:ticket].permit(:name))
    		redirect_to @ticket
	  	else
	    	render 'edit'
	  	end
	end

	def show
		@ticket = Ticket.find(params[:id])
	end

	private
	  def post_params
	    params.require(:ticket).permit(:name)
	  end
end
