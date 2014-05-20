require 'spec_helper'

describe Restaurant do
	xit 'is not valid withouot a name' do
		restaurant = Restaurant.new(name: nil)
		expect (restaurant).to have(1) 
		expect (restaurant.valid?).to eq false
	end
end