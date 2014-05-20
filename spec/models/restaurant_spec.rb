require 'spec_helper'

describe Restaurant do

	it 'should not be valid without capitalization' do
		restaurant = Restaurant.new(name: 'riccos')
		expect(restaurant).to have(1).error_on(:name)
	end

	it 'should not be valid without an address of sufficient length' do
		restaurant = Restaurant.new(address: 'na')
		expect(restaurant).to have(1).error_on(:address)
	end
end