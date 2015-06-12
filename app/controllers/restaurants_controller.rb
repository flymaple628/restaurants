class RestaurantsController < ApplicationController
	before_action :restaurant_find_one,:only=>[:show,:edit,:update,:destroy]
	#GET restaurant/
	def index
		@restaurants=Restaurant.all
	end
	#GET restaurant/:id
	def show
		# restaurant_find_one()
	end
	#GET restaurant/:id/edit
	def edit
		# restaurant_find_one()
	end
	#GET restaurant/new
	def new
		@restaurant=Restaurant.new
	end
	#POST restaurant/
	def create
		@restaurant=Restaurant.new(restaurant_form)
		@restaurant.save
		redirect_to restaurants_path
	end
	#PATCH restaurant/:id/edit
	def update
		# restaurant_find_one

		if @restaurant.update(restaurant_form)
			redirect_to restaurants_path
		else

		end
	end
	#DELETE restaurant/:id
	def destroy
		# @restaurant=Restaurant.find(params[:id])
		# restaurant_find_one()
		@restaurant.destroy
		redirect_to restaurants_path
	end

	private

	def restaurant_find_one
		@restaurant=Restaurant.find(params[:id])
	end

	def restaurant_form
		params.require(:restaurant).permit(:name,:location,:description,:minmoney)
	end
end
