class PersonController < ApplicationController
def new
		@person = Person.new
	end

	def index
		@people = Person.all
	end

	def create
		@person = Person.new(post_params)
		if @person.save
		  redirect_to @person
		else
			render 'new'
		end
	end

	def edit
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.find(params[:id])
		if params.has_key?(:person)
			@person.update(params[:person].permit(:name))
    		redirect_to @person
	  	else
	    	render 'edit'
	  	end
	end

	def show
		@person = Person.find(params[:id])
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy

		redirect_to people_path
	end

	private
	  def post_params
	    params.require(:person).permit(:name)
	  end
end
