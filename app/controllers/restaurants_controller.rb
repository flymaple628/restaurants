class RestaurantsController < ApplicationController
	before_action :restaurant_find_one,:only=>[:show,:edit,:update,:destroy]
	#GET restaurant/
	def index
		# @restaurants=Restaurant.all
		@restaurants = Restaurant.page(params[:page]).per(5)
		#給new用
		@restaurant=Restaurant.new


	end
	#GET restaurant/:id
	def show
		# restaurant_find_one()
	end
	#GET restaurant/:id/edit
	def edit

		# restaurant_find_one()
		#直接將畫面展現出來
		@restaurants = Restaurant.page(params[:page]).per(5)
		render :action=>:index
	end
	#GET restaurant/new
	def new
		@restaurant=Restaurant.new
	end
	#POST restaurant/
	def create
		@restaurants = Restaurant.page(params[:page]).per(5)
		@restaurant=Restaurant.new(restaurant_form)



		if @restaurant.save
			flash[:notice]="You have already save."
			redirect_to restaurants_path
		else
			render :action=>:index
		end
	end
	#PATCH restaurant/:id/edit
	def update
		# restaurant_find_one
		@restaurants = Restaurant.page(params[:page]).per(5)
		if @restaurant.update(restaurant_form)
			flash[:notice]="You have already save."
			redirect_to restaurants_path
		else
			render :action=>:index
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
	#確定使用者不可以輸入其他的欄位
	def restaurant_form
		params.require(:restaurant).permit(:name,:location,:description,:minmoney)
	end
end
