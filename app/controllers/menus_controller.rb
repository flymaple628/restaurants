class MenusController < ApplicationController
	before_action :menu_get_one,:only=>[:edit,:destroy,:update,:show]
	before_action :menu_get_list,:only=>[:edit,:index]
	#GET menu/
	def index

		@menu=Menu.new

	end
	#GET menu/:id
	def show

	end
	#GET menu/:id/edit/
	def edit
		render :action=>:index
	end

	#DELETE munu/:id
	def destroy
			@menu.destroy
			redirect_to menus_path
	end

	#POST menu/:id
	def create
		@menu=Menu.new(menu_juge_require)
		if @menu.save()
			redirect_to menus_path
		else
			render :action=>:index
		end

	end
	#PATCH menu/:id
	def update
			if @menu.update(menu_juge_require)
			redirect_to menu_path()
			else
				render :action=>:index
			end
	end


	private
	def menu_get_list
		@menus=Menu.page(params[:page]).per(5)
	end
	def menu_get_one
		@menu=Menu.find(params[:id])
	end
	def menu_juge_require
		params.require(:menu).permit(:name,:price,:remove_time,:ready_time,:ordderby,:tag)
	end
end
