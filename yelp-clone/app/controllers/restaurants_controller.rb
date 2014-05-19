class RestaurantsController < ApplicationController

	def index

	end

	def new

	end

	def create
		restaurant.create({name: 'Big Riccos', address: '1 City Road'})
	end
end
