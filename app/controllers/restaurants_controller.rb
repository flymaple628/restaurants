class RestaurantsController < ApplicationController
	#GET restaurant/
	def index
		@restaurants=Restaurant.all
	end
	#GET restaurant/:id
	def show

	end
	#GET restaurant/:id/edit
	def edit

	end
	#GET restaurant/new
	def new

	end
	#POST restaurant/
	def create

	end
	#PATCH restaurant/:id
	def update

	end
	#DELETE restaurant/:id
	def update

	end
end
