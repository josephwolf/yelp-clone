class RestaurantsController < ApplicationController

before_action :authenticate_user!, except: [:index]
	def index

		@restaurants = Restaurant.all
		@review = Review.new
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create(params[:restaurant].permit(:name, :address, :cuisine))
		if @restaurant.save
			redirect_to '/restaurants'
		else
			render 'new'
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice] = 'Baleeted!'
		redirect_to '/restaurants'
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update(params[:restaurant].permit(:name, :address, :cuisine))
			redirect_to '/restaurants'
		else
			render 'edit'
		end
	end
end
